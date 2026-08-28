"""Render the Project 4 Tanner graph with ASCII-safe English labels."""

from pathlib import Path

import matplotlib.pyplot as plt
from matplotlib.patches import Circle, Rectangle


H = (
    (1, 1, 0, 1, 0, 0),
    (0, 1, 1, 0, 1, 0),
    (1, 0, 0, 0, 1, 1),
    (0, 0, 1, 1, 0, 1),
)

VARIABLE_X = (1, 2, 3, 4, 5, 6)
CHECK_X = (1.2, 2.8, 4.4, 6.0)
VARIABLE_Y = 2.0
CHECK_Y = 0.5


def render(output: Path) -> None:
    fig, ax = plt.subplots(figsize=(16, 7), dpi=100)
    fig.patch.set_facecolor("white")
    ax.set_facecolor("white")

    for check_index, row in enumerate(H):
        for variable_index, connected in enumerate(row):
            if connected:
                ax.plot(
                    (VARIABLE_X[variable_index], CHECK_X[check_index]),
                    (VARIABLE_Y, CHECK_Y),
                    color="#334155",
                    linewidth=2.0,
                    zorder=1,
                )

    for index, x_value in enumerate(VARIABLE_X, start=1):
        ax.add_patch(
            Circle(
                (x_value, VARIABLE_Y),
                0.12,
                facecolor="#e0f2fe",
                edgecolor="#0369a1",
                linewidth=2.2,
                zorder=2,
            )
        )
        ax.text(
            x_value,
            VARIABLE_Y + 0.25,
            f"c_{index}",
            ha="center",
            va="bottom",
            fontsize=15,
            color="#0f172a",
        )

    for index, x_value in enumerate(CHECK_X, start=1):
        ax.add_patch(
            Rectangle(
                (x_value - 0.12, CHECK_Y - 0.12),
                0.24,
                0.24,
                facecolor="#fef3c7",
                edgecolor="#b45309",
                linewidth=2.2,
                zorder=2,
            )
        )
        ax.text(
            x_value,
            CHECK_Y,
            f"e_{index}",
            ha="center",
            va="center",
            fontsize=13,
            color="#0f172a",
            zorder=3,
        )

    ax.set_title(
        "Tanner Graph for Parity-Check Matrix H",
        fontsize=24,
        weight="semibold",
        color="#0f172a",
        pad=20,
    )
    ax.set_xlim(0.5, 6.5)
    ax.set_ylim(0.0, 2.55)
    ax.axis("off")
    fig.subplots_adjust(left=0.04, right=0.98, top=0.88, bottom=0.06)
    fig.savefig(output, dpi=100, facecolor="white")
    plt.close(fig)


if __name__ == "__main__":
    repository = Path(__file__).resolve().parents[1]
    render(repository / "Nhom5_DoAnTTS" / "Project4" / "tanner_ldpc.png")
