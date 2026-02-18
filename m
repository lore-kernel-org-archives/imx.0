Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F552FD697
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 17:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771435104; cv=none; b=CcBtgba3rs+9SJB9BvGVWMVqJsP4q/jXBbIWsfjjGZxopUfTYVcH0PWgJpLxIonTNwsboXurfznSmknkrMlor2CMINO5vCBLncR0W4UQlaO/fk20DPLxQSmYREo/IMq7FMaHjpOlFKinIDtDXAa6QevHPm7luu80gpH/WDHjMdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771435104; c=relaxed/simple;
	bh=szlnzjR28V+AV/VL45WXLE0et4t0WODgRR+kZ4Kcqa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbVdvMlOH0EnYlNrWM+kW/bNU8S3xH6bqBPpgRiq/uNYi26Om7g+6Y408FfK+Da1VEZv9wst3p/O9A3VQG2P8ka0cddC1WgCt+5p79dmndiNd46xWOCDlHANXsiIfTL/Rkq3dJ2skqkA4jv4TENYVulOLzyEViCmT6DwjsFEzbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9a2AnoM; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9a2AnoM"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59e5ea93a1aso84714e87.1
        for <imx@lists.linux.dev>; Wed, 18 Feb 2026 09:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771435101; x=1772039901; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DCcdS7x3lDtrIEUvGJcyqRB9D89Wp2xuvJCS6WrEmgQ=;
        b=Y9a2AnoMvzBYaHlLksKY+SSCQh1rXjsCz+wAPh9Xoe18HyVTbeB7YMLvvf3cXZCJNP
         SU/WRSNddtA/gyKZcxh2S9lrBeK78CMz0aCqTvsAVwqaD7YA6rNtJNP7oKzYQSGeO/j1
         xwUtDILYW0TohsEZ3voGzQCmjLJv/aQs0WZtJ4f88uuRjgNERrZbzYMb9kI4jPG1M7Ry
         dcqxCniPw7cCh8S9enoND7pqbR2qccVqy/NJJQ70ta5va372vATSUiFycd08FeE4LAxB
         olhrX/N3Kyf0fVfpANp7vNNvbwrPPB6jefpW+iaJvzBzZAQ3jCkSuv+5dTpibCVCeLtc
         /shA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771435101; x=1772039901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCcdS7x3lDtrIEUvGJcyqRB9D89Wp2xuvJCS6WrEmgQ=;
        b=b13gdBJPTQTBCyI1+T/7Zf2D9THErnPfzDOPbKqrEDPxFG0BC2CUhBiJGMscUAFc1l
         zhFa150aCiTmRjgf+N+fIt/GmL/jH1gq0sElevTRynx4+Cu6UJoeSseHSqrLf1z0z7sp
         /BaeaETMwrF0/PcxMZaa+n0aWbT5DVoFs1CREZ6a8ynZ55ZpURL6f4yBTtrKhH/jMu04
         r+OauhbWMB2tuerWZTkxkcQHTi9oFoT/DR3fxwnn3xD7ItfxijTaglxVEzGn7/39MXdf
         DdXWQA6b+burA7g9gNao6/IDf4Qn0W/uUnUo3u+ZMypE3X0TsuYMI+eB3zt1W5WADOqG
         sCbg==
X-Forwarded-Encrypted: i=1; AJvYcCWoKv9m/+yUwZjeS/YHnd1AsYHsd9LMyOmAkAWpb+Kf8BEmlOARVwzUm88aNbCxIccTm8w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2mhxS15yT6x/2H4kEFkE+Izx0E6sejzh2ACVTvDsaK2z/P792
	wZqGeK5HBzfbQr1dbwyl/rnubRdJEJ8+F7eWUFgY/t6grD2N5ctFPHuN
X-Gm-Gg: AZuq6aK8s2pbaslrCsqOy013RBGbeAcIJjSWgxGvBu/e8ESC+y5ABM9NvQh8rOPuTsH
	prCnDL0rsqwq9XaQa5cvY7+RaQsYXaFY6bjQfjlD6iYPomg8T7Ymj9hzrZK0hfr0F+PMt+FNPTu
	o7AXzPv9OWuCVQ/YLBet4HsfxWsqoSERUkhBt+lpSKhZNc9IVgoG2Zbc2viQSnKOt1h6Fnki5VH
	tLQLlF7sbjEYxrl4Sz1MPfIrC9JKKLY9wRwL4HD0OoVVhOT1a1IK3v+ayEalJz9Qau1AN4BCcGt
	fG7Fy/Z1L/5FDawX4+Lu+LYDc4HhN5DMrCW8ODI9aF3AnnVCadRSlG7F7rZK+SHYA2Q4FLQSnjk
	mLn0F61bpTqq3GNYgfQpThgjUko/0chDrcmou6ipaK/tlHA7zZV0pfjrSiYl+G43Cfd+No1eerK
	6KIbwik3S9L/FZhFInlTNG+xOQPpKG7NJCH0u6ZLtCpQd7e1FQ8b0SwEsKbluvSo/1dbaqAe0ru
	BecZ5125GQbYSy6qaRderoJifqubFPyUWhInNTSzrb9oHLXzRQh60sa
X-Received: by 2002:a05:6512:32c7:b0:59f:6947:7e7c with SMTP id 2adb3069b0e04-59f6d34d001mr4165286e87.9.1771435101026;
        Wed, 18 Feb 2026 09:18:21 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f568d95sm4644958e87.30.2026.02.18.09.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:18:20 -0800 (PST)
Date: Wed, 18 Feb 2026 18:18:16 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT configuration
Message-ID: <aZX0WB_6qPoCYVvC@Lord-Beerus.station>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3e79c4d806b8b8024b71bc99c36b09a2fbb90a65.1771353301.git.stefano.r@variscite.com>
 <CAOMZO5CAb8738HdH49WcY-JPTzQ90n4Bnmyn96_3jfw47mxOug@mail.gmail.com>
 <aZTEm8nUUVcKZH0v@Lord-Beerus.station>
 <aZXqSz_OsCC64P7i@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZXqSz_OsCC64P7i@lizhi-Precision-Tower-5810>

Hi Frank,

On Wed, Feb 18, 2026 at 11:35:23AM -0500, Frank Li wrote:
> On Tue, Feb 17, 2026 at 08:42:19PM +0100, Stefano Radaelli wrote:
> > Hi Fabio!
> >
> > On Tue, Feb 17, 2026 at 03:59:33PM -0300, Fabio Estevam wrote:
> > >
> > > What about users who still have boards with the Broadcom Wi-Fi chip?
> > >
> > > Will Wifi on the old boards stop working?
> >
> > The Broadcom-based WiFi module was used on earlier revisions of the
> > VAR-SOM-MX8MM. That hardware revision is no longer in production and
> > is not available for new orders. All currently manufactured and shipped
> > VAR-SOM-MX8MM modules integrate the NXP IW61x instead.
> 
> This common problem, we met similar case. After replace new compenent, it
> should be new boards, or new revision.
> 
> I don't suggest directly replace it to broken old one. You can create dt
> overlay files for new boards.
> 
> Krzysztof Kozlowski:
> 	how about other vendor handle similar case? Any guide line for
> that?
> 
> Frank
> 

Thanks for the feedback!

We understand the concern about potential regressions on older SOM
revisions. However, since the wireless module is soldered on the SOM
and not configurable, we are aligning the upstream device tree with
the hardware revision that is currently in production.

This change also aligns the i.MX8MM VAR-SOM with other VAR-SOM
platforms already present in mainline (e.g. i.MX8MP, i.MX93), which
use the IW61x wireless module as well. The intention is to keep the
VAR-SOM family consistent in mainline with the hardware that is
actively produced.

If there is a strong requirement to preserve an explicit description
of the older Broadcom-based revision in mainline, we can evaluate
adding a separate description.

Best regards,
Stefano
