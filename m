Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8BC24A061
	for <imx@lists.linux.dev>; Wed,  4 Jun 2025 12:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749041642; cv=none; b=Mj5DbSH2nrlj8v3NZoPyxbJb+QBOdvg8rpN6/bsmsuewV9PcMm64+ib2b/z0mqg0zeXAIwtCXwi4jiEqEwwWodA85frYcLypdJlvFBbww59mhKWQFsOpn+d/Wf0cPbLnIva5mFMK5Jcxo4YMvhRICVYtLsFxBwVEu3i8pPrzAqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749041642; c=relaxed/simple;
	bh=OZD7WcCyUzuzO15vKiLDI+M51i40/S5ipWMFGVsv91s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfQm1P1IaWHfTDfV9wbZKaji4vDnmhhiK6sM2Hf1pVIqpZZnHDuo3E/llF7us7rpNqn+kmHapxx4/EuG+Sj3+l2pOb5n+ilrEV/3/dWzFK268Zmfz23eJqxjIrD9PRN6hSQWllS6Na4PBMpNGIQi5PE1o8IxQmTl2NFv/dKoihA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6fj6eMY; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6fj6eMY"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-311e2cc157bso5579925a91.2
        for <imx@lists.linux.dev>; Wed, 04 Jun 2025 05:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749041639; x=1749646439; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjvlidjGUQC4SxdMsrlPY8e5lq5D3hS45/TeUXFKOwY=;
        b=V6fj6eMYmsaULqYUoV0GSdiI+qAtDxFiTVxOvnqAy4gyW1PFQVGZgx0JwTanyBTCim
         qbmSuozN77Htm0cK/8PWUwmntWSkeTl9WnPds/F5YElNXiseYPXLPmywhTlFB5yb1Lmn
         q1D7g68T/QIaLvZuMf3CWdp7v8Dy5wbbY0C+vIxYMgDT90zrtckpsI0pIoQsQ7uI8nAu
         YOJGK1/KAWHVzgNQ1xyYumXJOFbVudmfmdz6/81sL5NTINxDLWSvlE9VO1Rwu7Iht/sc
         FeMi8GRjRJDeg8fuBnwLuP0YHGLL38W7LT7JxGUHiKp5pgkqW68oEgz6Tug4ixUn67ea
         VLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749041639; x=1749646439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjvlidjGUQC4SxdMsrlPY8e5lq5D3hS45/TeUXFKOwY=;
        b=S6xpqXQn3aSIimOGRXtoUh6brQlYja2mHo9NSrjbS3Zdxy7e06uQsebErDIPUKnK70
         iurZ6mms/h7GDeTEzfy/MHFGCT13jMPQ95zUkIWCbY1WiYH/Svuh0+FEgGkqoEue8y52
         iDlrB0mrytzVoYOpnL4w1/qsaI4EcaPXc+fv0V50kBWTZEo8AbqmMghKdT/dgNB429xQ
         TPGTzrUrpITLqzxGpNU5qwKwUT6O37LAkqMDbsG7rUtOzpgJ9hgCWI0TPs2hiyWT6ES7
         IP3ddn7s5LqppDg9Q2YVpHmatgLYg6uPvCwlyf8shjq9am8czIRpdrtULaxbPEgo7aou
         FHrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj77V10ZECsqq7uJbZi/WR+Z73X2qFOCI/A5gNOOz3l+HuOLLeU07OpkQQ2Tint5981C4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzurI+BrZETTYHac2T0bK1FwMkOGK10qvP+wt+76hN6vKOSlTqV
	dY2Teem9aM62Syha2llnS/gXVC/GCHXJYo9OUENVq++cSlygSSdTMUiXuiTRj1eO7z+oGLR1rEe
	vGX2L/uPX+/ozR4RXTx6dXhzA6luY0Ls=
X-Gm-Gg: ASbGncsEjklO+rt8z/P7LQCSnu+z2vW799d7F1OQ3s0gI+xDQwDhnwr23NJXJ4XixP1
	GUg+YAewpeGNN4vRlp7L8KxmllzfhCz7b1iuy7Dcgz9jjt5IT8m0ncBMFfi9Dqc1zkOfRSEAan1
	gac4YBHMBsYIdF8f9LjLkl0JcdtEtgIA==
X-Google-Smtp-Source: AGHT+IF8BahbWPg3PJ0D16BlqIY1qWwOW5iNYKdNrQkdBaMB8hXbKb0RJuekC/SLvpfEpMn9z+5vwKt1GFfdaEoA8s0=
X-Received: by 2002:a17:90b:35c5:b0:311:be51:bdf8 with SMTP id
 98e67ed59e1d1-3130cd6d85emr4203307a91.3.1749041638951; Wed, 04 Jun 2025
 05:53:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com> <20250604-imx95-rproc-1-v1-2-a6e5f512731c@nxp.com>
In-Reply-To: <20250604-imx95-rproc-1-v1-2-a6e5f512731c@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 4 Jun 2025 15:55:55 +0300
X-Gm-Features: AX0GCFuQSVALoqDz8lEd52R5b_qpD5ZIb0xjVNRy7BAJHJd7nx_8wHvUzvLriIg
Message-ID: <CAEnQRZByPkxojykJ3w-Mxko08Nc5txsOCL4vy+P76HuTy3YTaA@mail.gmail.com>
Subject: Re: [PATCH 2/3] remoteproc: imx_rproc: Add support for System Manager API
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

Thanks a lot for the patches. Comments inline:

On Wed, Jun 4, 2025 at 5:36=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
>
> There are three cases for M7:
>  (1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
couldn't -> can't

>  (2) M7 in a separate Logical Machine that Linux could control it using
>      LMM protocol
could -> can

>  (3) M7 runs in same Logical Machine as A55, so Linux could control it
>      using CPU protocol
could -> can

>
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Add IMX_RPROC_SM to indicate the remotecores runs on a SoC that
>    has System Manager.

remotecores -> remote core

>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(got
>    from DTB), if same, use CPU protocol to start/stop. Otherwise, use
>    LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
>    the M7 LM is under control of A55 LM.
>
> Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
> to decouple U-Boot and Linux.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 139 +++++++++++++++++++++++++++++++++++=
+++++-
>  drivers/remoteproc/imx_rproc.h |   2 +
>  2 files changed, 139 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rpro=
c.c
> index 74299af1d7f10a0db794de494c52304b2323b89f..0649faa98725db99366946c65=
edf5b7daff78316 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> +#include <linux/firmware/imx/sm.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/mailbox_client.h>
> @@ -21,6 +22,7 @@
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/scmi_imx_protocol.h>
>  #include <linux/workqueue.h>
>
>  #include "imx_rproc.h"
> @@ -91,6 +93,11 @@ struct imx_rproc_mem {
>  #define ATT_CORE_MASK   0xffff
>  #define ATT_CORE(I)     BIT((I))
>
> +/* Logical Machine Operation */
> +#define IMX_RPROC_FLAGS_SM_LMM_OP      BIT(0)
> +/* Linux has permission to handle the Logical Machine of remote cores */
> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL   BIT(1)
> +
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>  static void imx_rproc_free_mbox(struct rproc *rproc);
>
> @@ -115,6 +122,22 @@ struct imx_rproc {
>         u32                             entry;          /* cpu start addr=
ess */
>         u32                             core_index;
>         struct dev_pm_domain_list       *pd_list;
> +       /* For i.MX System Manager based systems */
> +       u32                             cpuid;
> +       u32                             lmid;
> +       u32                             flags;
> +};
> +
> +static const struct imx_rproc_att imx_rproc_att_imx95_m7[] =3D {
> +       /* dev addr , sys addr  , size      , flags */
> +       /* TCM CODE NON-SECURE */
> +       { 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +       /* TCM SYS NON-SECURE*/
> +       { 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +       /* DDR */
> +       { 0x80000000, 0x80000000, 0x50000000, 0 },
>  };

^ this belongs to patch 3/3

Otherwise, patch looks good to me.
