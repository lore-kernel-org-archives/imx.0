Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ED5309EF7
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 08:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770107570; cv=pass; b=hC5xmKqdELtgq2PoCRSW/028z74MeEIr/jxVmqB0xZaZXlHtv6Zt4YjMeK+WE8aZtnVB5toj+4wj2Biv02Si7w/LQCyk16SGsDwmkP5ifhNk+glGmoSSj6KAhOz373sdeHRyyfm0ATlBaQFbW0CfsSE1D6tADLSCgRLPhsBcYqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770107570; c=relaxed/simple;
	bh=ry0FHVTHq/pJe0PrqW5meMtNFTvAS6/0OqoEfkOx9WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWuxQ3sT2+FJgbWn3cXTfQ7T5paXSaA3CZkiJciGLAlnAoK6dui4GLusvKrigE8JP3UZnvN8mbtZLhNZ+uxHBitj56j+C2Zpas4t1+DzR28MV4s7biT/OAIH3kjtcDaHzXMLk0NBOT8N17yfrT1q+ogTkYTlxLZhzx3EiPfODRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idmDQQKI; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idmDQQKI"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12460a7caa2so8127395c88.1
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 00:32:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770107566; cv=none;
        d=google.com; s=arc-20240605;
        b=Qqd7xVusv9uce4Ued3WFScfzRM4qNr+DTA72oFP2A9zz5yerkHpTNz+z2rxfphpRqo
         VsgC7nad2Oyddz+BkKLbxoZd8G6YztpMkEJo1wfCrVOSmlhVv3z7Xrd+69tFZTwpn/wf
         RcajRCH9tZubj/l6KOhD8ttJIvZLO0zcuNtQ31NJXU2mf+Yfpjhfrt/dl+gvxWvHsy2o
         Z5LGBBPwaJg6NN61PjT9heyGxfJNxKV/EtKt5jMDd1BYfBR8PhUawylomwN558Mlrh2E
         qD2ofbDnPnbWvOpihlOPrCswyM/oneWyjFH5iE6YjPZ22sqV/Y3jZLokYShKUkNIgwx+
         l9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ry0FHVTHq/pJe0PrqW5meMtNFTvAS6/0OqoEfkOx9WI=;
        fh=iyTTZqOLtDHwxfT6wb1wRLieKzZFbxxxwZCR1qDjcxg=;
        b=QWcUQqy0kj8R1wimNsIj+V/3RnLmfqmRiAA+69OSPKurStsZ/Gs3Efg1GbiI6E8XUF
         JNJI5khFUKW+mqJ6PBip6uV60gfdum9qqYxCBgIfFR1+M70mF2euvWL2Rcj/YAHAvDxZ
         lmHtEo6jzZcxweFu+pie2IHYZ9Du/SpQPhpCtDhp1nP6n6a2Hje7DNLyNvpWwrLBTGHP
         SXA/2AM2hWfDxAMadWvShqw5EfIU6beUoJaHurK3LVA3eMydJuiQmBBLIuekYNC93KD3
         W58adzPDf+S9KWqn8xnAMvAxe1XR2O9p0UTVmATf/XU67L9lt1eaQWnVhTVRmiv72JQ0
         3Gqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770107566; x=1770712366; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ry0FHVTHq/pJe0PrqW5meMtNFTvAS6/0OqoEfkOx9WI=;
        b=idmDQQKI5uSaWMqqTWZJU0JWpT80Y3mEinlx3las3ZQksF3DMdc1cW4UVoPsa9l9kw
         TQE26HRqH/yn04IW1i73e6+vXtM0swBLPwfY880sc0rlsO4KPz78KCryQ9k/WMfgejnE
         04baIrYFL3q4ZQRDIX3k/xxeU7urxLNeZhTyWICrLuq8Oq1xGpeDu198HTB0v9JPmgnQ
         VrUgRBQ6CG0qWooFZbK5KtNRMNJEGTRk9VxbASvCB4vZQpTe6CdhoBkmNY0tgXkOL1RE
         d0FtXAVT7cIqhbdei7Os/sz2y/Wrv1+Z4CUuBNVv2zPrXYe+pyXhyWZiYbhPdD7TbUHP
         z/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770107566; x=1770712366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ry0FHVTHq/pJe0PrqW5meMtNFTvAS6/0OqoEfkOx9WI=;
        b=D3EGKr5J/9UhQ4KSgJkCP+WVPP3Zf+yEMzuxWNqOnYDqnKQAKw/POuwsAh5Btp1xl4
         tBYwD5my90YYJjdCX6YLQtw26jFtpVgNeqNoGAhYWb9RswzHQC2RB7sp57OQg13fi3+w
         LmLv89sLI1bsoZKWPpsSOlzDjot535KRqGZdG3XkFT4XHrQAEr0L8RA5FzzAxbKGBcTc
         +9TJdAhqzu37WMQrLcjCR+qME8t0XpU91IQeqRrsEUsGZAqOij3MrRX7kB41j3Jd26rJ
         mBsDhf0kQg3ixSyswrYnVFH9QbVvDke2SQAj8bEMSscUUj7heHHL7gp/iBIa6ICDwB3S
         +TmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJmdn10OQorcBIUSIyWPnCM0jfw4iEgnJl2QMUrUtRV2E6KV3RSb0BBXQt2ppfv4tGLcw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz18wgQHjd1jxEgvfP5rcxeCvSE+KLbyL/TS/ah5oOZDsmab3el
	Ejk4LymFpNIGAyAL+AzogFt9TR4UcoNGyfdcZ54VPy1QR80OIWVcuJfhDkmEQbsa3q/R5oN9Uxe
	gG42SHo3ec73b8FL056c25NhHV8QR1ds=
X-Gm-Gg: AZuq6aKpBkhiDiEYjMKyUTIG7XUvT+gFl35cPQxEGqrAhtZ8+PbHtIr8qTwCGUulOJ7
	AlROFNVQXbUsbLiXlQD5bjYoyyR5KGAca2CvFgKp/PZut30RKyOxyRcdTijMYr65YyzfhQdqehS
	WvAAXkZc20hqmPQuubzt5+9Kiz7kJrfpVrDrTeXnxsi4aWca6U4bfdWW4pi6QorbkoAtw6W469J
	sSxbpkoN/+mD/b6wCozfm2Ixe7A0uNqIC9xNxFRDN0DTzzllBOptmmntMf4SklaXRcbwk8g+3eN
	ba/um34iYV3VG9n5CjqEnn52pK5VFM5wpe5jGr1tYRVHNcsQgmlD/Yr3MJUrb8P/C2YpHim6yld
	11uB/pvGdQQ==
X-Received: by 2002:a05:7022:160b:b0:119:e569:f60d with SMTP id
 a92af1059eb24-125c0f8c302mr7264388c88.6.1770107566507; Tue, 03 Feb 2026
 00:32:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203031345.3850533-1-shengjiu.wang@nxp.com> <20260203031345.3850533-3-shengjiu.wang@nxp.com>
In-Reply-To: <20260203031345.3850533-3-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 10:35:27 +0200
X-Gm-Features: AZwV_Qgw24M2z0kseZy1hei1NjvsOXkgK0vaXVyKxBbNrRS-X0jSjdoVh3qv9-s
Message-ID: <CAEnQRZAgjyKYZEJ9FVqRsCfzLOqwbRZXahqMMNdJpP54NAQ1PQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ASoC: fsl_asrc_m2m: Add option to start ASRC
 before DMA device for M2M
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 5:13=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.com=
> wrote:
>
> There is a limitation on i.MX952 that dma request is not cleared at the
> end of conversion with dma slave mode. Which causes sample is dropped
> from the input fifo on the second time if dma is triggered before the
> client device and EDMA may copy wrong data from output fifo as the output
> fifo is not ready in the beginning.
>
> The solution is to trigger asrc before dma on i.MX952, and add delay to
> wait output data is generated then start the EDMA for output, otherwise
> the m2m function has noise issues.
>
> So add an option to start ASRC first for M2M before ASRC is enabled on
> i.MX952.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
