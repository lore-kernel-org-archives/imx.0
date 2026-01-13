Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E74272E63
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 10:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300370; cv=none; b=bbIROwP8qS6qMy1VqqcwkEEF1HJYwvEBCDqdfjV6qwamrR4B1J8ceIy0b4HkA9H+4XFxPosr1eNCIDRKe6klH6zhYzGHxgIc0Uge9vmAK3non35Ba5c5Xb287L2j9tyRxEtiUQTnmJYy9lF091SmzcnKoiWHSmSTdt4znDLxY/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300370; c=relaxed/simple;
	bh=B3vp471iO9G2IAkfVMr1n9TxCnurZNGHqjOVlBUGUyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2xGrZvqwMXy8E3D2gq+INFn/yVAG3ObE4yohJ3mkX0U70HsaSwjul2mTO8udnPb6rG3YCZd/ss4FcTELRRFJ9fv9AQiQWhFfCzsJfnny+MUZY6A9t39n6+fynn5E8AZPPoIACo+IlSLCLtVHXP1Rz7unRY7UqTGQEjDKLB0jLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrAyV3j5; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrAyV3j5"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12331482b8fso431878c88.1
        for <imx@lists.linux.dev>; Tue, 13 Jan 2026 02:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768300368; x=1768905168; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osa+xJHGbeo/qaRpfjFH2v35lVfZ55PmRd0/QnD48vU=;
        b=LrAyV3j552ZKvXsDZsLL87kLng6wiwrMvnOrT+vsAa5d8b1ckymH5tDlNODH8L6ojy
         jTV2TpElcxIpbM4WsCIRHQk+CSs51d3bRzpjPr4iMDwL7epKZr9LCev/csnTl1FqmZ1E
         7aBtuCd23wlQmYfaXJxBYhWEG0UGFu3gypwKBu+Sd1plGYHd9Q7OB2z/7KSfJ1Menv/a
         UHdXdalCKIxxWDuOnEj3qKF3/gkRmXrzM94hkqBhWY69ljRxpqAOasfZfdkVbzFHeHkx
         EInpPHqiwPskOJjOy0IJdlkl7td4748JhLxx5nIrZAdoOH/fACX43pS2rpfRC5S/Pkls
         hzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300368; x=1768905168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=osa+xJHGbeo/qaRpfjFH2v35lVfZ55PmRd0/QnD48vU=;
        b=apyJsX84Udg2JdOFF3aijcVKSDK7C3K+C3YaK9ArfNpr8o33Mp+AWiyx4L86b52lqr
         8SkRGku+GJRjLgyw392xsdBIDbqGsydXlsvNdWjq/wq/xWHAZEwidx/8Z+aJx6pohpOw
         OSzdx1IUQfWi3n0E1KT/dh694q7Tq7069AuTi9Fq89BB11fDKy5rtyCA6bnr9TDBSZtG
         nO1spKF+ZevVxSLTO0yhXrmSpNVMOIz/nS0wHX2uNTnfBoDMq7QvNn+/7qeZvbaruO23
         iqG6zO0Du6yt06MQqnXzkn4JfDqI5up+TMNEnaoBtwybMd7PCRwK0LIOlgdSR+QP4cIZ
         oTpA==
X-Forwarded-Encrypted: i=1; AJvYcCX8wNcj/Gb1ywnik54i5GLi/vfZcqzjCAxtkVrY518zrRSIC/Qw66fEvTgqu+N3rUyqk/s=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywxyr72tp4GVieIj/p2+cOnWxkLW95+Gg3DsceZQMSvxkMZv6XH
	4IM4hBLceag6vTsG6qEZGu2v5r//gTZsL2jjJ+ig5DpfxuZnqUjJavlinh72VCycwV5oHAH88Bj
	ZuT0Nrdv3SiAwADZWLRhncqZvTtLfle15qHBC
X-Gm-Gg: AY/fxX4AxhZ3+goJq22riKPETowd19xxqhwqpFmDBOSvN7HK/RwrblEn6nC5Msz6vqw
	qTq89OY4k+BiLwU+eAdnHOgt4RnvjU5aDoD8mThbLzTHp8+QuwFJPjv7DtYue/Gq/ynOok7FV1p
	H1nA60EaAPA6fY5bMUmKl6dKYpbA9LCGUvFfn9K40cesCq+PQ+rZ7ZVfJDqjQCTpnO36/DagrpA
	Kzz4gBtSoUNhVov5d70zEFZHQJW3QWmS8ts3MYDzAmX1IP2P9j4CC+1Xf5wh8efyho7PJcZwLpv
	cp7/JTpLY4ZSpLjdOAaF7IeaXUeU6zM09WGXZZjmUW/CF48gMofvhXRWfmbUkcyvwaciPE8p5Yx
	q81jcR2OBbA==
X-Google-Smtp-Source: AGHT+IEgK7geK/3cl8glUX3kvw7WMOfIDt2tBZpuAwsH31XulbEBmQ7DbpdByWJmbKz9iTb4wDcBLYcU2OxmyHrWmzI=
X-Received: by 2002:a05:7022:eacb:b0:11a:fe6f:806a with SMTP id
 a92af1059eb24-121f8b4df9emr21162959c88.31.1768300367916; Tue, 13 Jan 2026
 02:32:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260109-imx95-rproc-2026-1-8-v6-0-d2fefb36263d@nxp.com> <20260109-imx95-rproc-2026-1-8-v6-4-d2fefb36263d@nxp.com>
In-Reply-To: <20260109-imx95-rproc-2026-1-8-v6-4-d2fefb36263d@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 12:35:17 +0200
X-Gm-Features: AZwV_Qiq_ikDCBbZhohG-5uh93Q5VVXl1wxrH8Z59kRq7qiDXmFqbdmDKMYIm24
Message-ID: <CAEnQRZA6aLBJd29ySMCnD4y93m7TRS3vDTqN993jiL6QoUfyBg@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] remoteproc: imx_rproc: Add support for System
 Manager LMM API
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 2:11=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
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
> Depending on SM configuration, M7 can be used as follows:
>  (1) M7 in a separate Logical Machine (LM) from A55 cores, that Linux
>      can't control
>  (2) M7 in a separate LM from A55 cores that Linux can control using LMM
>      protocol.
>  (3) M7 runs in same Logical Machine as A55 cores, so Linux can control i=
t
>      using CPU protocol
>
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>    is fixed as 1 in SM firmware if M7 is in a separate LM),
>    if Linux LM ID is not same as M7 LM ID(linux and M7 in same LM), use
>    LMM protocol to start/stop. CPU protocol support will be added in the
>    following patch. Whether using CPU or LMM protocol to start/stop, the
>    M7 status detection could use CPU protocol to detect started or not. S=
o
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case (1) and (2), Use SCMI_IMX_LMM_POWER_ON to detect whethe=
r
>    the M7 LM is under control of A55 LM.
>  - For above case , after using SCMI_IMX_LMM_POWER_ON to check
>    permission, SCMI_IMX_LMM_SHUTDOWN API should be called to shutdown
>    the M7 LM to save power only when M7 LM is going to be started by
>    remoteproc framework. Otherwise bypass SCMI_IMX_LMM_SHUTDOWN API if
>    M7 LM is started before booting Linux.
>
> Current setup relies on pre-Linux software(U-Boot) to do M7 TCM ECC
> initialization. In future, we could add the support in Linux to decouple
> U-Boot and Linux.
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Ok, for my R-b tag but in this case of re-writing the code in the
future please remove the tag
as new reviews needs to be done.

The code is OK although it needs a bit of a time to understand it. The
commit message should
only point important stuff - that cannot be understood from the code easily=
.

Overall, I'm fine with this. I think it is in a mergeable form.
