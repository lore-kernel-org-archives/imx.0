Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72BD248F63
	for <imx@lists.linux.dev>; Mon, 23 Jun 2025 12:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683407; cv=none; b=oA0TF3JxKXJWzo1qdyVCLNSPo8IQ5UEA30idxBjCtHxl5FFQlRHaxDLE6fvF9QmPuWlevPAiGaeDP8CZ6Gxy1cLdTusvU5xa1fIH1ENY2H3rk20Qro3im16vj85MP7FlaB8qopVBwMk75ctbPa4GIW/n2LtCw+BcihgUB4B3l/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683407; c=relaxed/simple;
	bh=7n4fuwiYJUTibWNIDCfCMV6f+zSGKadvPylADSrSODI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqVrpvGSpbha4srJ9rBlQGmQCNvzcDw0/SCjK4U6WsBlZ+XmxLFQQstdD/IGyiNh3ljVelOL8lGYpLYW0C97fNSF87ZWx6W2P/iuDdlMkn6YPCLlQnxYlYQGjx+ccG3DXW/+Rvnc/BiE4hGn1xf+T5t4MEseAFR5Clauu33DNS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGue6/w5; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGue6/w5"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b544e7b4so4278823e87.3
        for <imx@lists.linux.dev>; Mon, 23 Jun 2025 05:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750683404; x=1751288204; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/PYDyDKGZYKEGjVXXHlyij22R64l8wztxMeZv4XmnE=;
        b=QGue6/w5DsXek928ZbuxKwX48Q2qz2RUC7y29YNeoddKtUCbBWwc7NMM8TWaeLn7tc
         XlR9mW3X7k/kmL046mpsR0b/j4w5aKp+QZ20I1ja4HTltdon9r1QTx2rB+Vwr9nMgY2a
         5vkr/PyGCNUMzZfFrbnZz4VDXM6xFTBkcvS83uxkGqE//lo3uEdO5xNjmzweU031yTI9
         Rjzahke9apovT8VzqYpN+ZnshG+U4yB/zf+vvJb4e2PWtNUGtRYzkjdIsksajRMb2uf4
         cZliWphw/o1LAAGSbc6bkyjU6Aa4sRvmE6v3ADEPTevKuBkDMY3vNzSyW2piMYzHA3pT
         ZprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750683404; x=1751288204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/PYDyDKGZYKEGjVXXHlyij22R64l8wztxMeZv4XmnE=;
        b=fQoFtHn1V23J9C+vXI/QnyUCF3+HtZeWmdjchLRG6gZx4DL9w7kmyk3otDjT6CLLWl
         Fc1xw7jOdylSpFyG6I2TvAMdjcupr0g1UGZIaABfeRQMKPRrZEKdwtLXSZIBIqTXxSYX
         FlunQHLbic1XpU0Tu5eTu5oMkk5wwcPNzojbbj+FoCC851W2elLOLvVBNwZHK1pxc+oQ
         cb7VZUV4yXFiell/+BxX1tGeDQBxEYeA8DFlt7kAdzQ96DkKZLlz1WFn6cRB8Dz8sz5R
         nKBEjAlt2sfIRuwymLBDpesgl1iQwtAA1rIobl4SJM6IWoG98dizRpuwPKyX1RmMR/18
         nqiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCejikTghFDQpHjMSC/s3C5ZKf9dqnQKV4tNM3UMh6PW8JAmycqR8+lZ2DBrMsXxxSblg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxahVTtWAKwIdc8KGMluO1VxMiXOCYXqhH03j7bzTJ9AhZgZQ7s
	ASFdAgVnfmeYEZY6FqmcjDYdW46zOCTesDE6FnEKjYJPLw743GViUR14w6FVlus1+2u4f5kiMSA
	gFVvv2dWKAPbwv0Lznt8oXokh/43bjSE=
X-Gm-Gg: ASbGnct1C5Xwp8OUXZW42yfpUNwPwEGiwPuKqPQOw1PmpKxnx5mnxvX1wXTN6AS6EA1
	WK/IxYlWgc/5S8/Rbz1uL2PW5I8XwzDJ5Q+OeHSuXBuCjG2xzjuysGeUEK0GaThK67uNa+XV1Y4
	fHuEc6gE1AkM992x6rvOGjs82RLqwzNr/NySbYQpRB1BO14bPsLrsFYMvWW0oczqbK30OvZRl35
	Ik=
X-Google-Smtp-Source: AGHT+IHVX0GlIPq3TBaQtLm46YetyZZ0s+N9/Y4hGKlfh5oMqO78Ds4mOXk6wiprWLKaWnye4Cex5x6r2Jq+usWNPy8=
X-Received: by 2002:a05:6512:159d:b0:553:ceed:c85f with SMTP id
 2adb3069b0e04-553e3bb4cbbmr3113374e87.21.1750683403609; Mon, 23 Jun 2025
 05:56:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250623095732.2139853-1-joy.zou@nxp.com> <20250623095732.2139853-9-joy.zou@nxp.com>
In-Reply-To: <20250623095732.2139853-9-joy.zou@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 23 Jun 2025 09:56:31 -0300
X-Gm-Features: AX0GCFuGOUHw2mx0QPMnuqMm-hZkSD1S0Ck80ClMf9fqxc9r2EVikPukaYObI_I
Message-ID: <CAOMZO5AzU03qEg80vhyU=CrgVgYt+rn=WQ7SphtADxOc5eG5tQ@mail.gmail.com>
Subject: Re: [PATCH v6 8/9] pmdomain: imx93-blk-ctrl: mask DSI and PXP PD
 domain register on i.MX91
To: Joy Zou <joy.zou@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, catalin.marinas@arm.com, 
	will@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	ulf.hansson@linaro.org, richardcochran@gmail.com, kernel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-pm@vger.kernel.or, 
	frank.li@nxp.com, ye.li@nxp.com, ping.bai@nxp.com, aisheng.dong@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 7:00=E2=80=AFAM Joy Zou <joy.zou@nxp.com> wrote:

> +static const struct imx93_blk_ctrl_data imx91_media_blk_ctl_dev_data =3D=
 {
> +       .domains =3D imx93_media_blk_ctl_domain_data,
> +       .skip_mask =3D BIT(IMX93_MEDIABLK_PD_MIPI_DSI) | BIT(IMX93_MEDIAB=
LK_PD_PXP),
> +       .num_domains =3D ARRAY_SIZE(imx93_media_blk_ctl_domain_data),
> +       .clk_names =3D (const char *[]){ "axi", "apb", "nic", },
> +       .num_clks =3D 3,

Instead of hardcoding the number of clocks, what about using
ARRAY_SIZE() instead?

Like it was done here:

https://lore.kernel.org/linux-arm-kernel/20250619062108.2016511-1-xiaolei.w=
ang@windriver.com/
