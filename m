Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCE32472A5
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 15:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069103; cv=none; b=N25B8dnq9Ez87NI+5dxrb/xmqFa/Vw5BQMOiiBW9Fs/k39ed3bitv5am/Os7ycaG1UDGxbhej0fTDCK7rB4QJ6p+5gCw9NspHoYp1FgjNOt4vmMhy5OZ06+Ryc3Zbx+ElZizma69iqwz7ysCzFViN6HAMiDjsxn6u/A9Wd0eCo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069103; c=relaxed/simple;
	bh=9HBDxuMmv5skzQl4UT7wyOdZmkNQerDRJWVbJNp1mqM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ff3lluskjO1jgKaunFIeAJH0F2P+pqt5ZKYIHLJbU6rU3AvSNbJwdTAfRH4P2girSEnST99QJBiz4/55SFFCJeMoAUSxn5I7vsHqhffgbTTy5SuAYKKWSGWfLuJ8f3CR7TSOQ4kGpr5GOCFt4OaeTuP7dRyfehNOfydlZhZbQSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sAI0/V2f; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sAI0/V2f"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8EEBC1A2D55;
	Mon,  9 Mar 2026 15:11:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64BDD5FFB8;
	Mon,  9 Mar 2026 15:11:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6452110369C05;
	Mon,  9 Mar 2026 16:11:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773069099; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7JXs9JPlH1EFUBa4y7Zu+UQwHDwDOw9hKMguqAinxxA=;
	b=sAI0/V2fOKDCAIIu17PDW7TyNOOytaasThnsBQdJvP2Z+5QKV9ZlcnDHfoTeOCzVwIQXF+
	Sjub3GxEYFtFVeyH9vP0RM5Hn/sTu6ozGfJPlJg+1SUccVT5gmi1YXeVNNzSe7dXQKxbzj
	ihtr82t+oXpMCCLvPwmr5FDauPfpzjd5Y0YlnR1ERqHL4G+0+vQoHGW1ruLO5vCJec7NUr
	ue3yLaoPx8OA9IUfmVUZVGrHThnaZOtrQjkl1K8v6e0GvNbXd7oUjjcmc2KDXn1e7I96Ge
	zZT5ZeqLZulMiXPe07lR45GLHTl7mB5NhY1uf1SfTD3fFczCLKv5ox+ICwFRAg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Han Xu <han.xu@nxp.com>,
  Eberhard Stoll <eberhard.stoll@kontron.de>,  Frieder Schrempf
 <frieder.schrempf@kontron.de>,  Tudor Ambarus <tudor.ambarus@linaro.org>,
  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  imx@lists.linux.dev
Subject: Re: [PATCH RFC 2/7] mtd: spinand: Add support for clock to RX delay
 setting
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-2-9326bbc492d6@kontron.de>
	(Frieder Schrempf's message of "Tue, 03 Mar 2026 17:29:23 +0100")
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
	<20260303-fsl-qspi-rx-sampling-delay-v1-2-9326bbc492d6@kontron.de>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 09 Mar 2026 16:11:34 +0100
Message-ID: <87qzptnil5.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3


> +#define SPINAND_RX_SAMPLING_DELAY(__delay)				\
> +	.rx_sampling_delay_ns =3D __delay

For this macro I would be in favour of suffixing it with the unit,
ie: _NS.

Miqu=C3=A8l
