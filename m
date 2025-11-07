Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A143093C1
	for <imx@lists.linux.dev>; Fri,  7 Nov 2025 07:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762501902; cv=none; b=C3h5UmKyprshyftsFAfWkQpTzZZwDlNyAqub87un13as5qYiDCNa77VM4/ktnt1mO/bKBi2y81nvQAxpNrXF+44t0bZqUq7Zak1HcjV+IbqTEW1jcLCAR+1InOg+h9D15mu7n3ZwHfA6jqKl01ycGuAegFsb/Rb1z/eD0aiKACU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762501902; c=relaxed/simple;
	bh=m3vCS5fEBZTrIlk0oaQTEp9kJKU7A5DiAAXFXV5fdVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r98ejXeL2hb7caNx2wHowURyiLc7l9OOJbFTPqmgW/tZAU6Z1AAlmgQ+XvOwFuMKI6XW6opC841rgQ89WLVzClZpQfgYyRdQuT6S/ZSkSNjZrSrvhw7rO88wsMLV8ZvEiMyov+z/xY5pJEWE4WvmachXes7nPvG6BuXU26bZ3ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7iIwXnN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7iIwXnN"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29470bc80ceso5049465ad.1
        for <imx@lists.linux.dev>; Thu, 06 Nov 2025 23:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762501900; x=1763106700; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3vCS5fEBZTrIlk0oaQTEp9kJKU7A5DiAAXFXV5fdVI=;
        b=I7iIwXnNG3Ssm5yXJj1gyP7CPBls87bEcQJvb86oIHRUx80KBQp+1+l4qL0ilJio3X
         bB5fF3PN9GB26BMOuPHCKK1SSLIRwgf0ZJV5tq4Y1vSkB5/XebAqsrTzs2bde7ePHgUd
         A+BR/4yLnLXs+Xd79sEg/WWZNOv+jZGDsuXOnkZUq6e4iyaA7dsoIXnSFT8Y6rwfMiqH
         PJRUfSSlBvDz1HVwMaicJev+/j0IUCDPYqvnoHFYSV3CpDdXoFJyW9Va2by7B6UMIqnD
         myN61d8wQEIdVqZ93+RmrDLLGBIPHZ2pvbhY0yhRq2oLvdscCKG8Ydh+EYDIs0sBM1qO
         Af5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762501900; x=1763106700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m3vCS5fEBZTrIlk0oaQTEp9kJKU7A5DiAAXFXV5fdVI=;
        b=mptE54Uznce0RghoN2kO0viDAx7H5T4/uEP6QaalsUdHI31FgteVGKC48Z3g5vl/hq
         m4stVF9CxpdjAnDgveXveZS9n52rAH5+wy5wZuZENQjb5hIvWRN3B5N9VSzyjTX4VA7d
         TdDn/PC7xcezH2oQ4f8J4SwDWXVEL1u9ofp+iS9AlTyf8E/6Gxn0K5lghLCgnSf6GqIg
         kgbFPq8ABH20FJpMqAcssmU3Wi9Gb0orlu6QaQIk3g/NkzqvOf1bDQmCMUVpcpOBRMdw
         Q0pGis+rc/qc1tWDEJkr+bBHD2q7YEMmKg7M7qW1cmOF0cgAoBHV9q2B7OMnJDTzYUq2
         6Tjw==
X-Forwarded-Encrypted: i=1; AJvYcCUhsAMsar5I+0kB+AS6tzcYWzvLRmYE2xN5sceREQNUVjNGnnaxP4YgD/bzIxnsdyI/2sk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7YN8f3ECjZJt8dw91BQge71qPg3xHE04X3oVEoANRsyZ5S9Fb
	5G99ty2ffmxcF6mMLEP3AAZ+QS2oTCO7GPDFK3TGQitxCQXrPxXOMLFIDAZBNvTWqv7eqqrYsoi
	AYyt5CuTJ1eerMjk7fYLx/i2GCU3IQzI=
X-Gm-Gg: ASbGncsDx84YTva8DzEdAtcLqQiycjIDEId7LgGMUT4ogDMU1Prnds6iCpvySQbl72v
	4qFtlf4CkgnhWl2t8gBCs1RUXZtxCekRW2hqJPEzsG8tmGjXhxMFD/m7edzuBNKt8m7e4uNqQHW
	5wo1Si+Qr2kDeVF/yR60TuJUVRyJ5YdMGOXG4M+JqcwMBn0IjNLaFfusIX89TDwf3AWwhhGGmuM
	Hj78jqN3v5wqNfCiKohq/flCvjGwP/wZhcavazhFJM/iXA3pimerxqa7Q==
X-Google-Smtp-Source: AGHT+IFkh8XME/XKdmm+TIe47BXYcMMyHnwgbqIA5X6bAhqAdmw5d+3JqyQ85nbSaeZPIXV7fRyM4oESPwNxWKjSk8M=
X-Received: by 2002:a17:902:e847:b0:292:9ac7:2608 with SMTP id
 d9443c01a7336-297c94b32a9mr11604375ad.8.1762501899726; Thu, 06 Nov 2025
 23:51:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com> <20251031-imx95-rproc-2025-10-31-v2-2-758b2e547a55@nxp.com>
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-2-758b2e547a55@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 7 Nov 2025 09:54:06 +0200
X-Gm-Features: AWmQ_bnGeOFtoZrRWw9KhEpAzRXkaZJvKZO7s-geVquRIrpRxLbcQTb4ng5zby8
Message-ID: <CAEnQRZBJCZOO9yLr-T_DT_QYerKgRP9gdasmUK+WN+d8VJPV6w@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] remoteproc: imx_rproc: Add runtime ops copy to
 support dynamic behavior
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 4:27=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Structure imx_rproc_dcfg contains a const pointer to imx_rproc_plat_ops,
> which defines the start/stop/detect_mode operations for a remote processo=
r.
> To preserve the const correctness of the static configuration while
> allowing runtime modification of ops behavior, introduce a new
> imx_rproc_plat_ops member in struct imx_rproc named `ops`.
>
> During initialization, dcfg->ops is assigned to priv->ops.
> Enable the driver to safely override ops at runtime without affecting the
> original const configuration.
>
> Improve flexibility for platforms that require dynamic operation switchin=
g
> (e.g. i.MX95 Logical Machine ops and CPU ops).
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
