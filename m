Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8382F3B
	for <imx@lists.linux.dev>; Fri, 28 Mar 2025 08:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743150860; cv=none; b=DuoJ+iAidH5rG4GiMAwH8xB+mkuMt/VSoRCqxp8E1HLI/cp6H3GU5PPfAeeHOg61KWb2HgO5wqcHss4vJJQqpJEuLBrowCpFaUP6rsLPckpwXJ6NfTA2gg1QzJ0dki7lr//q4+dbjYMyNwRRZU3LxRiuiFjhgxJleA2ZaECjCy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743150860; c=relaxed/simple;
	bh=ZOjkFZ7BFQi6G4Jqg2uwAw8Twpd0W2wDSgbVpuRDCB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aPOT/UITu0WtwjljFnO2xrjk6Dhmo97DKI85cKiouner9h4Qh/lulHkNK8Q/Rr/LVrFfA0gJkUGeHV4dKWYI5eiFxxfn013CQ0RemZWCaigtBFXdzpRgeFc+tQTAD/MY3xkPaMJMvoezUY6b0gGaPBjbLyS1Y2fgjNDe0vD/c0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFwxUA3k; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFwxUA3k"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30185d00446so2576972a91.0
        for <imx@lists.linux.dev>; Fri, 28 Mar 2025 01:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743150858; x=1743755658; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rxxKtxp1frS/ucj+/vrHXDgykeiYNdM6wlPTF4Db3c=;
        b=ZFwxUA3kDOgvrTuzQt5ACLM/UYeGNnJaZCs1Mw2EpyHuvx66ybHaPtklQhjJn6pFIF
         FQgk64FrHMM43RQw7BGVak4P5WrNi0Ll2mksk+fC/ek76TTumLfdoNBP3D4hcIHPkFyK
         lfAJBax7Q8k5MtNbxvDt/xJnoVKU10hvFqrWCTNYxEPnixBifaHVc0FUIdUBPjJ4uru2
         mxB4XjKRJ3OyGPCIcCclAYVIm4hUVobY21Ai3lCrSH9SHFK79sQuXhSrQwbt/AcVb3Jw
         oLfvbsxgsFSLsmH/bXjsaNsTWZ3yPJ7/Bucx5DBDIwYgoRuHtY8qybJjv3yX1yA3sKXB
         BtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743150858; x=1743755658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rxxKtxp1frS/ucj+/vrHXDgykeiYNdM6wlPTF4Db3c=;
        b=loA4LuElADfv3nS5ePMV1JafcQ02Oeo+XToy2whlwUDcZWt4RDInKJz5aHAKyhtqsW
         o4PyL1S0D5nvPwDN1HiypShmW6wJmWCRs/63Myr/t02U9G15rPECeUfyivIYodN2BsIR
         k2WpNcA549fU+IaiFRU6GBt79Ud/qHGH7//p+/0fPMXIwh9S+vO/dKVsYFA9zpx7nNUo
         DYQktydPEW9QXa/DHCpuOC0zDCZ/evLViRKPkBD8unKhmWX9a6Uh54abJnuBlR+XqB3g
         U9QNxQvTF9USjySMYDLjyrJPjyMVmeU30lf4W75PYcVuxOWs4c1OZob8bNX5hv5IDlDr
         wszw==
X-Forwarded-Encrypted: i=1; AJvYcCV4s/xrrpH6/6Zq2PpY/VMysMHbsAvrOhZZk9t2W8H0oSSjHjvBOi0RKRsDIgu6sqV4utI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywebp6MtUigv6DT83yX7VpkfpippYdSJ/s7sWlqAkV9lEK/UM1i
	uOsW+KWiW2+2eNozZ9zbeswrk+CBnERIQ2qZxcNTFOJ8X4fFDp5KGZZ6EjqE/rqlCo2WcA5Y3RE
	q6Ii4FwZqe7TYMZzP1TRUYO5Pj0k=
X-Gm-Gg: ASbGnctb8TF2XIiAEgShrfIbzQSznth/3wuShNv5eIFS/m8Tq/Ipled8WnckFYkBOYN
	a8HIVwKk09mXKYdFkjUkbcQq4MAB91OjJXE/xAZx0jy51jCgAoaAJWZD1Hv2YANi+JNkIB8rM+R
	flZYf+5kjoYN0Jz4dhE9AtAmc=
X-Google-Smtp-Source: AGHT+IF11wwSuNqF7pUfzisNp2o2JHE+e/bTTG2jQulsEtYEXB9Y+0sNfCMi43CBuG1cp6jFC1ouNOKlmRa2RqKP3SE=
X-Received: by 2002:a17:90b:2f07:b0:2fa:2268:1af4 with SMTP id
 98e67ed59e1d1-3051c889b0dmr3132648a91.7.1743150857908; Fri, 28 Mar 2025
 01:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com> <20250210-8qxp_camera-v3-7-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-7-324f5105accc@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 28 Mar 2025 10:35:44 +0200
X-Gm-Features: AQ5f1JpmDTleDRGa2oBcGXFZnflEOzTPa-iL5lCB0QpwZJnUePwDVEuepPhFb_8
Message-ID: <CAEnQRZAmCrZ=OmMLWF80mrMih+uFDKMp3dGsEosJe0vCHgEEYw@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] media: imx8mq-mipi-csi2: Add imx8mq_plat_data
 for different compatible strings
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Robert Chiras <robert.chiras@nxp.com>, "Guoniu.zhou" <guoniu.zhou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 11:02=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
>
> Introduce `imx8mq_plat_data` along with enable/disable callback operation=
s
> to facilitate support for new chips. No functional changes.
>
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v2 to v3
> - none
> change from v1 to v2
> - remove internal review tags
> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 60 ++++++++++++++++++++-=
------
>  1 file changed, 46 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/medi=
a/platform/nxp/imx8mq-mipi-csi2.c
> index 1f2657cf6e824..b5eae56d92f49 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -62,6 +62,8 @@
>  #define CSI2RX_CFG_VID_P_FIFO_SEND_LEVEL       0x188
>  #define CSI2RX_CFG_DISABLE_PAYLOAD_1           0x130
>
> +struct csi_state;
> +
>  enum {
>         ST_POWERED      =3D 1,
>         ST_STREAMING    =3D 2,
> @@ -83,11 +85,11 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2=
_NUM_CLKS] =3D {
>
>  #define CSI2_NUM_CLKS  ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
>
> -#define        GPR_CSI2_1_RX_ENABLE            BIT(13)
> -#define        GPR_CSI2_1_VID_INTFC_ENB        BIT(12)
> -#define        GPR_CSI2_1_HSEL                 BIT(10)
> -#define        GPR_CSI2_1_CONT_CLK_MODE        BIT(8)
> -#define        GPR_CSI2_1_S_PRG_RXHS_SETTLE(x) (((x) & 0x3f) << 2)
> +struct imx8mq_plat_data {
> +       const char *name;
> +       int (*enable)(struct csi_state *state, u32 hs_settle);
> +       void (*disable)(struct csi_state *state);
> +};
>
>  /*
>   * The send level configures the number of entries that must accumulate =
in
> @@ -106,6 +108,7 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2=
_NUM_CLKS] =3D {
>
>  struct csi_state {
>         struct device *dev;
> +       const struct imx8mq_plat_data *pdata;
>         void __iomem *regs;
>         struct clk_bulk_data clks[CSI2_NUM_CLKS];
>         struct reset_control *rst;
> @@ -137,6 +140,35 @@ struct csi2_pix_format {
>         u8 width;
>  };
>
> +/* ---------------------------------------------------------------------=
--------

I would drop this line. It doesn't make code easier to read.
> + * i.MX8MQ GPR
> + */

Just say: /* i.MX8MQ GPR */

This pattern happens in a lot of places.
