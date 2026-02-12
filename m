Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3467B2D8367
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770888537; cv=pass; b=IU+XM/8suo2bRHIQ/SE4mXQIr5jQGjJ1Q8SonuGE4zwMbakQAyzYsu6LgvX7F4BnQ713SqOumSLoBvh0jyVj7fPCA2RuEVJOszPSeLtninNlfSaLXBVFWt6Wv/fOMxk1WnOPIqB90veHAHuvMNPSel2hxIlB3MXZ4xN2Cg4oGPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770888537; c=relaxed/simple;
	bh=8UBxJormBXMIna0vALf5yVJXI99hPt+eRkrBgltu420=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hr2GpojRsRFDAHp3N6KamiUpN1/ypB5TqClk4bfJp6EeMEeTgH/KR5KSVYlrYKSFCU+X8DvtcDah/HYRDA7bCBm0xeJmnrXrx7h7r/lNCScy3ZKD/RUqULvHL8VtTPOeD3A1AGXTGXolUVPgmYF+vYDCmpyB/9TUyuIGP/yrCy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtRzOBKT; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtRzOBKT"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-124a95e592fso1294843c88.0
        for <imx@lists.linux.dev>; Thu, 12 Feb 2026 01:28:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770888535; cv=none;
        d=google.com; s=arc-20240605;
        b=chZsq7Kk5dKMN/B4+wGqrbGJpECd2+VHVdRBwM4Qep2UofveMutkxXKkDUkBPpmxb+
         QNNLo4CL2JX7bQLGT1lpCSXBS89y1rhFTZVQ58PMBdtTRLBoxbBsNpDVn+uyyliKjSvT
         hsKCLD5Rw9UwkKGMqL/TqRr5AmoiVhofsuitf27WFMlmEXRJ/tEfonhZ0HSYs+zozyZE
         ZM67Mp00WIswV5JN99z5uTc0XDvEJvkj94QCCtvbnQzlBr0xgOoB8V7nbWgBbHkV4ZY6
         SlQbtWLLPjCEYTQ2Hx6FD6vbuyc/B0zox+A0yiB1DQVqLOIYJVf/xBDIqGHx6/AaffJs
         tLLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8UBxJormBXMIna0vALf5yVJXI99hPt+eRkrBgltu420=;
        fh=230whGD/ubUdX5ERJQ9K9/yRkCUbz1ZgZUG+PvIwSpQ=;
        b=kthPn+RJpkZoR95jaGmilc3MVmpKeb5sf/S3fNU8CP3Dhxcnij6RpMhK3RX3oGTjaR
         PdSTOLKHM9pOsW7b2eDKNRzrtKaIBqaVcvwfZDxl23HKakaE5ok0erXEUez5MQaZGiHE
         G0bU6ew6PiBjSfWdle+PQQgM0mnXVKQn1QlzIqmx70YPCorKvyxrI3mTn3A9V0KNnta9
         wc2ObIE36EOqMmJm24zBJ/d0bSGR3Nn3THvUaY2haIA7WHbvonmpxtW2kf/lCrBqZeo2
         CrxuMm07RS9WJcaHPT88QUf6DzVo6zu+HAencByExvxGn95lmPFdrVNu1m2PXWDKiGvN
         WiPQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770888535; x=1771493335; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UBxJormBXMIna0vALf5yVJXI99hPt+eRkrBgltu420=;
        b=AtRzOBKTcvMIURwPy4M2vvg/53LtOgmyOcL0M6tLBAjdKS9HwiUszmFAfoBvdQEoC1
         LOKC1Ru9j22xTOyYIhM/fHXrA+ipPqt+epRRO5sT4+Vpu1cZZPs3oWMnyxO6bwSPpVKS
         J6yJSsGoXOFahJV4Ths401pwxGgm+L7dGKPVIgkeRPiHNfe3SlksxPkIIVxot1sze+PN
         SstDIQxwN0mknCn1FUaZ6Cc3aQnrPApYnvut2rrHyGXRL+xs6MvSuKhPog816ekIm6oP
         JB74sRcQVmynyYRxYqFWyI3XH6WCqtgfmrEbTkLC611eWe5I5uDp/Od9MPnopSZHgCig
         Itkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770888535; x=1771493335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8UBxJormBXMIna0vALf5yVJXI99hPt+eRkrBgltu420=;
        b=lI9gzYYNnAldBUyoxISY7N1j+TrFunyRL4+pJsPWmGqqoFghYMDsXRE7zfOnfOJ4JR
         +JUzq/CLPFLxrzx7u3cYu/luQrwpyBDIBsV+7uqFXFKYQWdrHLbYUDB6WwDC6tCN7EG6
         QQw5p3CsUi3bPqkTjejy5k+12I5tegtCEUXOjd9hzEDX84i8SjIYNiaut29r6WGAts6H
         7EHOdz8oPiqJEMr2IFwoQO2nRE3tB3/6Zv+FRr7W8QrhLDbS9zwObvFDqYx0d4z10nlR
         dcOPp9kkmVy1m/e7oLiaWMwBJP4DAzrJXddHBwfRpk2ksEsZw7gGUnjsuDSkGRUpho4J
         o8iw==
X-Forwarded-Encrypted: i=1; AJvYcCXC0NQnbTxDaBOXaxpVlMVOlBu6ngT/dOwWTeT+PFGQbUEVM11Opt22c9jbVVbAiPyrf4E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyVEaGyOOIAcJN7plijYEN/Y9h3dBwNRiUlNJ/POI1zUyM1DHJ
	04C1AaknHHIrR/I4Pg3CxH+j4vNcSvHQJTFvv6ZpsGU63ZctYwGvmh1BT9FZPyJzsmiR63vXM1j
	KS/ntL1gfHHKyWz2ubQ9W0H1gGnRU9Uo=
X-Gm-Gg: AZuq6aJeR8ImnYj/jqI7hn8S0E5qWfFbGXefgEnckA5hAb4Faz3j4vKryzbp51vCcLI
	F3wrvKZaqc8YDG1SnUNWK3I+sM0EljOv+fQ9fLU1pxFRymts4gMpSj78YrWKpcUqIWOTJcMpBuI
	n8lsslY17okk8bLK2RwMO8i+HhCtCsySE5K2xbVocutSqrHrKo0wsZiKpZYIQOmJwQw28NX4DRj
	+DhKLf2cdOSgIHek/LV698k31lw31Tn/IFcuZgtG6IGh2dZROhhSeTk/3m79tpvT/WyTFlSs2hh
	/HZf9+99foYZnXFWkea34QK2Jg6NkI4B6VsHC0GlHDWPUKWIGZMRmkNHHgiEP3O0HnNMMVfy4ZU
	ob7YzBleFF9OvB/+EjXyVzbqOS7bhz/1M
X-Received: by 2002:a05:7022:6081:b0:125:be41:db5b with SMTP id
 a92af1059eb24-1272f780d9cmr917943c88.42.1770888535262; Thu, 12 Feb 2026
 01:28:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260211-imx25_dts_simple_warning-v1-0-7b40e1acca27@nxp.com> <20260211-imx25_dts_simple_warning-v1-2-7b40e1acca27@nxp.com>
In-Reply-To: <20260211-imx25_dts_simple_warning-v1-2-7b40e1acca27@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 12 Feb 2026 11:31:37 +0200
X-Gm-Features: AZwV_QgGMIlcIGcwVtxSix2gOB2fixK07XuT9MDhx5OR9fCA5qKRVtqrGhICOTY
Message-ID: <CAEnQRZBUNOiTBhgypWDjBUYqNv2LBUf33REqKRM-zqnnkwx9TA@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: imx27-eukrea-cpuimx27: rename uart8250 to serial
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Alexander Shiyan <shc_work@mail.ru>, Shawn Guo <shawn.guo@freescale.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 1:13=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> Rename node name uart8250 to serial to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: uart8250@=
3,200000 (ns8250): $nodename:0: 'uart8250@3,200000' does not match '^serial=
(@.*)?$'
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
