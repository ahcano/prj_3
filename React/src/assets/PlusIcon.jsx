import React from "react";

function PlusIcon({ className }) {
  return (
    <svg
      className={className} // Apply the className prop to the SVG element
      xmlns="http://www.w3.org/2000/svg"
      width="800"
      height="800"
      viewBox="0 0 32 32"
      fill="currentColor"
    >
      <g fill="none" fillRule="evenodd" stroke="none" strokeWidth="1">
        <g fill="currentColor" transform="translate(-100 -1035)">
          <path d="M130 1063c0 1.1-.896 2-2 2h-24c-1.104 0-2-.9-2-2v-24c0-1.1.896-2 2-2h24c1.104 0 2 .9 2 2v24zm-2-28h-24a4 4 0 00-4 4v24a4 4 0 004 4h24a4 4 0 004-4v-24a4 4 0 00-4-4zm-6 15h-5v-5c0-.55-.448-1-1-1s-1 .45-1 1v5h-5c-.552 0-1 .45-1 1s.448 1 1 1h5v5c0 .55.448 1 1 1s1-.45 1-1v-5h5c.552 0 1-.45 1-1s-.448-1-1-1z"></path>
        </g>
      </g>
    </svg>
  );
}

export default PlusIcon;
