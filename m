Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020852DC34B
	for <imx@lists.linux.dev>; Tue,  9 Sep 2025 12:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757419576; cv=none; b=scVI/jUFmn87zH/tZO4V5N7BcatnoZPeXHSBkUe0O3RsTVcAb1Qoo6gnKOYUxy/zf+R7TijfGkO8syrHgZRE/VO2O6suSXzoctDlKVXmCcnkU69BVIiZ2pcmt+vmyetu516H7P+WNyjWB1a8hlEiShcC+/5x+tJHKE4Oz01G0yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757419576; c=relaxed/simple;
	bh=Xr731uKqvVgyQ0JBxGdH48L+AwHB4RFNteh0epE5Tj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bdyM2xwgABq/JDn+aDPTM7ex/buCiUnnGzFEDaqLizJbVXTlUdgvUxTAi8YsNkyqce9/B03VRDp08rHRj7ZMmURt2XE+P9DCPHmiE+PhOSyvV94dAmhZcNoG4/x258xDo9P7vGxh+dRtjbrv1ApLfPpImrISvZ3oK8ru6Prsgy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTcA+pIJ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTcA+pIJ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-24eb713b2dfso35039325ad.0
        for <imx@lists.linux.dev>; Tue, 09 Sep 2025 05:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757419574; x=1758024374; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0Dr+zkj3mEIxzfhKQFQoELzzbl4Q3IPyXE5eMtiFKo=;
        b=mTcA+pIJPAfRtYJTKqGnMQXglRSzm4Ozm5okyQEv5yYveuS9SnGmgpUPOmywwh6sGd
         V/uewAVjk+WkRgYSP6anFVcFDAYnw5Jwv/QRTSQ4q5oj5C4bZHp1sSdSnQ+YilxKvh4w
         rC+IOJrrJvFjklM2RuxsD61fSMUyBR8n2FXlJdh3vHuWZ1TxJkl3fElJaFDY6dLP3g/t
         IO44PQz8L7PI8tT7yhdZuRnstWaI6ynqdDEuWF041h0eRaXxXP2MsO8vOUz8wYymTYq+
         cTXAbZwgWXjbVflb+VnLqY+hXQU5kE5hbihK1cALLW4TWU4a1YfCsoiZDB/76ZFIG7wG
         vzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757419574; x=1758024374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0Dr+zkj3mEIxzfhKQFQoELzzbl4Q3IPyXE5eMtiFKo=;
        b=IkDa1uHsqjNKqk06tnMz9o3VEJQRKqxL81CtzdMfrXmePzqUsQ25cOhD52y7al5hHu
         KqZc93fT7WnuKfhMkaM2xYEYFvt9zDjPNbj+xSTZNkjP04JFAyVZJOwiG4RCNep8J1Ls
         VS56uW4vznH5k66HgjIKgjVJU2S0GxQ0c6F7SERIUt/XLBi00dk1S+UEHcgCpimHxOVf
         OJGlRs1ixgMpcYzZSaejGe+Tpjnbj84UvlRB/f21b0dHtRRGQkvzI6KODpNX+Mn1ZNfX
         xMn+GbYZnmhWsMZXYQFQJ+//hUAtFToP0dzi3o0D8K0EIENMXQSVbUTqddQ3jOB1e65w
         ysvQ==
X-Forwarded-Encrypted: i=1; AJvYcCURSMXEQRD203YtaE1MPo6C6ZI0kaMjvmml1PZVNXhRQcrViOLekxbrY9tvZiVO79Xpsms=@lists.linux.dev
X-Gm-Message-State: AOJu0Yznp2JHkt5pQFtzgsfF3c60I0b262vVIDYZFDbgdybgyZa9IDli
	adi4mku2qXhjnt7nLCsgB46Vc7D3Jiuae0SBxjRlbA5EI3wfg5cO5FA5CfqeJcffj5EO2aFIDmz
	X7H85JSzg9/KD78W4+/yFbdwplBEQkZg=
X-Gm-Gg: ASbGncu8CpqH5WQkE8o6AvlPxQNaMKKAjVwxvgWdzJRhikjHHQxP6BY/CslI0COQIyS
	tQ7zkr2CaMljjX5+mFnPZKcADqE9VPU8ABZ0Abke0cVstE1vG/srDb8RjCaqqHA2paJJVTyQ1gu
	MRQPRBBKlYESwbRWgEmVXeX8Z6xuSVPUy43WjYv+cWOfMDm/lG9LzvkcwDq8tjiaUZCAJMQNcim
	P4caaV2/3f7nU1whIoEsizkoVUARzuzKBmbD7jBjfAm5TM=
X-Google-Smtp-Source: AGHT+IF0E23UFEub2CKYrBfDrjLIfLkU4iafJArDl/DfkMDOfmcBH9AaefT4iAXaXjXQyR5D9SnfU06+PwSFYyE7+Ks=
X-Received: by 2002:a17:902:f684:b0:24c:be1f:c1f9 with SMTP id
 d9443c01a7336-2516d33d2demr127944945ad.8.1757419573988; Tue, 09 Sep 2025
 05:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
In-Reply-To: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Sep 2025 15:08:24 +0300
X-Gm-Features: Ac12FXygHbi9xw84Hag5OJCVb5BcG8TXx4Q-7E41-mn1lRl_A0XLq_HSPq3mWfk
Message-ID: <CAEnQRZBW1vfKx8DqV9iJEb6vhWPZ3=szxV0NDwW5h6+LTYLpvQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] remoteproc: imx_proc: Simplify driver by removing the switch-case
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 4:08=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> This patchset serves as a preparing patchset for i.MX95 support.
>
> The current code logic is complicated, with mix the usage of switch-case
> and if-else.
>
> To simplify the code logic:
>  Introduce struct imx_rproc_plat_ops to wrap platform start,stop,detect_m=
ode.
>  Each imx_rproc_dcfg data structure is assigned a ops pointer.
>  The common imx_rproc_{start,stop}() directly invokes the plat ops, no
>  need the switch-case.
>  mmio/smc/scu_api ops are included.
>  No functional changes.
>
> Thanks to Daniel and Frank for the help.
>
> Test on i.MX8MM for MMIO ops, i.MX8MP for SMC ops. For SCU-API ops,
> I currently not have a setup at hand, I will give a setup and test
> later, but everything should be fine, no functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>


Thanks a lot Peng. Entire series looks good to me.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
