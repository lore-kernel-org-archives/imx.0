Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFCA30BBA5
	for <imx@lists.linux.dev>; Fri,  7 Nov 2025 09:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762506696; cv=none; b=O0gLg7BSGpQ0g97pu+ecq2CCyr/9YWGGbn/Shew5Q85xT3LYCF5O1BeuSd6LBln2ZbaT1Ph72X/b/kMBGfmG/N72+iuRYSX8JBvF4fDaz0Cl0KsAmmQ7l27AClIaD8dtpbFHCkbaAncwbZJ7Rpd1yCcFxakBOTdw423GQdTaj8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762506696; c=relaxed/simple;
	bh=Xm0T+ra2WFrzdRdP3JxtuaEukspvdWnhUZFpw+N+Mdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CNFTF1GxrSaH/WN+raTtJ9XqnfisOCkfUpq6tbyGC3tzDr6VryXi2epKe+Q4P31EbwAuYMtNErm0T4lCuyUtxyRTmpyDdXV2fOuXq0jNwUnjicO5/dcRz5FhtSqLyHD0WlCfyVm+82q1KPzCAz1eY8ZhO9hIZl6XJDIJ7s3Zg50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iE6lyiSp; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iE6lyiSp"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29470bc80ceso5706535ad.1
        for <imx@lists.linux.dev>; Fri, 07 Nov 2025 01:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762506694; x=1763111494; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hW8/cbGR87ObHsZ6SNcI+MXLmQ5paXElRz+RxrOT/SU=;
        b=iE6lyiSpf9kLskccVjUQ8omBGWdlhzHh23qJ8p+bj8PFS1n/LN9M7pa7GrDlsLSQot
         BWBju6jD6cKmzlY1ci8RjHlZ/p6Nk3tsFbYpw/cNo/rQ6Stm43Psls2MciQH4XW9QK5P
         mbMx4eoZsPgmLVp1Ba7ZGU8JUIBgCrjhNdun9GdsfW30vZqEES2fdKHFf4VVGJh1/qVS
         3NWUFAJonH+WAiBAkZOH9ZVIr24Sb93jzVIzrOXvtXaxscN6IOkQkK3+wiApn+ybsspQ
         Q6IbEKr6egnFxcY5MO7UiNAILyvI6GR5XTBAP+c9N5lVyWGQ7KEgciHuI5gcQTPqkOYy
         vW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762506694; x=1763111494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hW8/cbGR87ObHsZ6SNcI+MXLmQ5paXElRz+RxrOT/SU=;
        b=lNJ4nrufviB0zTzBScBhQP00r8ZUG3e1/8PlEtbNVe5wsEsyxV0VyZW52epSmUiCi1
         BKcmHwnEV5+vPJU6ch3N6x3t44Ao0aOJGg6BeMhlX/8rdljmeirbTsibGFRotpUS11A7
         SOeL5ZY0DOcJLToXFiTa5WywdJsLeyMWUAEgVZbQTLuRlEn1UC/atT0P39ekzxJe6z5N
         K2mvv8RXbC5jVm0X/NuD0PHB0acvzZNFHGjiPeTbH/3qVQ9OYUOIe5wh8C+uillR2Wcm
         BXS2VzThCStqehquzYPsk3D+XA3inlIOKbV9U502Z436wUZblf3qYG2dqHYQIzkkN1Tx
         omnw==
X-Forwarded-Encrypted: i=1; AJvYcCXnoJv/HZSDc6BOFkH13I/O277VzGSzbjqrDRbEGt7TOII0bvWkSK1UTPWba76IvW4yvEQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWelx5ZyCm/GjXlDZOVqw1SKTWa0rRDtjgME56GGXM2G6+aTyE
	hTmnV8lLnzMbqybNOeM7ZdVB3DXIvphjhZ/eJPQEKHAMMRY7SR5RcqZrB3jqn0aogKelggrc0Ka
	Vef8LI6TpmVQoEZK/Bi6TZ3cjZDx53Ik=
X-Gm-Gg: ASbGnct8AXLMcUPxMKM/KXKskBBNW2F/uTF6ipsU5pxsI5MN4c0jqcGal4nHlGXKvlR
	ODbCRtZoes3L2Lg/RNWubVoSQCCADCrRMbGAgMwswDBfCOIVToZN3h86GyBsJDvM6MEOZlCSWcw
	305qgcRT/OBVhPtZ6xN+x4TGMYFJQzwSiUt8R9qKJO8+uvsCv+UsHI2uFBYlzDJngYrSIXPDdZE
	Rw43oAabCXq3jgKkvCan0+OVTqUlmUlvaYC6wcCRWckf5vX9a/vPk0m7g==
X-Google-Smtp-Source: AGHT+IFsw4Qh5yQvF8GQ7bDn+i+78HlvDDo9Xlss7dAXe32EJJ3DKG/FTpv0vFs5HihRB4beIyG1MovPvmR4t9DxwLk=
X-Received: by 2002:a17:902:f705:b0:295:57f6:759 with SMTP id
 d9443c01a7336-297c95acc53mr15301995ad.15.1762506694201; Fri, 07 Nov 2025
 01:11:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com> <20251031-imx95-rproc-2025-10-31-v2-5-758b2e547a55@nxp.com>
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-5-758b2e547a55@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 7 Nov 2025 11:13:59 +0200
X-Gm-Features: AWmQ_bkGy3n9ih8PCPlxo3uy5k4L6qRRgXRYWv7PUkhd8VPxIzhklJdDlhNWAZ4
Message-ID: <CAEnQRZDcrWdAFqJkcbjy-jL=EczgmSM9grv5zp6bntWnqou_kQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] remoteproc: imx_rproc: Add support for i.MX95
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
> Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
> Add i.MX95 of_device_id entry.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

With the minor comment below, you can add my:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

<snip>

> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 =3D {
> +       .att            =3D imx_rproc_att_imx95_m7,
> +       .att_size       =3D ARRAY_SIZE(imx_rproc_att_imx95_m7),
> +       .ops            =3D &imx_rproc_ops_sm,
> +       /* Must align with System Manager Firmware */

I would add a comment here like this:

> +       .cpuid          =3D 1, /* Use 1 as default cpu id for M7 core */
> +       .lmid           =3D 1, /* Use 1 as default Logical Machine where =
M7 resides */
> +};
> +
