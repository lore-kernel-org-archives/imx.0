Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BD6101D2
	for <imx@lists.linux.dev>; Thu,  1 Feb 2024 02:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706753159; cv=none; b=eLiJYjgyQAfv6NTtm7X9p5+hgqwLR5b4faG2hlCBtdDJPFzKH9DmvYavwI88xUS1nJAf/0UgB7PYa5UKmEXyEcquxHMO4cMKhHl2z3LPO7fKorK4glW+bl54BvKT80oG22p5AndWd8mNwC5M3fjmTTcK+kxwWSUa4YgbfvUlXLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706753159; c=relaxed/simple;
	bh=WZKyyU3njHxkaPfTiuVOaKohUtAcLb9qZANIc0cHy6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kaUGgsYQj3IERjm8Qfn+nyLQAGEuq4CPhXFaqloJffXKcE3KwtgpTEVb/08j6onD9yksDjqzKHBiXwPrVzFYFg7NkRUoixLp4ADe6YKuPb/C0K6UAqeu36RXr2fdN7OlKOhylROEDlVU702VITVuQotvvRr+3dJfh2nCcNbmo7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mu1v8bUF; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mu1v8bUF"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so341073a12.3
        for <imx@lists.linux.dev>; Wed, 31 Jan 2024 18:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706753157; x=1707357957; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CabtX6HVlcsvD8Lc4Od57wI4l06g03/hrDUv1/sVAuA=;
        b=mu1v8bUFCiAiS6EDdt1gk9z3Ia3tjAqpXXAslFcC1VAqtVgsxR9xqdwGQFTR11w3/R
         GLpjWwwrgzC56Jo381+nQalmIoPJJpMlAjI32wV7UVdhTGu1bQyi1BcYv+yS1Xi4nZVx
         drHBtE45MuWL95tREtr5F96GLfFCEq9++WRR+xHh+gRGYJNQLOKX+q+vA2ZpOpadqlYu
         KV4pmIeLZn+8Ob/waFXSs4U651jqkuKXEHSX0weL5y1HBJ4FN3Q5vHpNJxURgp04pGCR
         ETKZBpAEoSCOHYE0sV5pfd+mKIveNy4ZBs5aJtlmN1KnUn9OHJVAqmI8z+T8S3BWOiji
         2r8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706753157; x=1707357957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CabtX6HVlcsvD8Lc4Od57wI4l06g03/hrDUv1/sVAuA=;
        b=MI0jqnORvkzV5g3gKJ+dKFtyvmCNRMYbLy7zu89XjEUxG4Mp7pcB4pvIfHg9TZbvS6
         8eBddLX5vK5d9zZj9tPxL2auBRX+ozJt1ibsEuz7XxCBhN6swQUOJLHjWu7hyPFL44Iv
         8IMr0lbxbRI1NMX8cHlbHSU6Zgnsmt1vu0zHt86GGDVwR6UpEC60KqkDBd3tSNVV9NtS
         rWQ3JFNoSDm8tMBqcL+Ys1BPzxPQBjWdKHfZxFlzCtXfT6R7D0VZjM78wN/kK/0JYHjW
         SZXIW1izUeTWqicN5JuKbkwPueUjD8pzhxAGhmo0hjkOORP62lniHKBFybP/JJnL9bi6
         urTg==
X-Gm-Message-State: AOJu0YyDiwGpVZ8GIzJ2Kb+nwsr6LM2H7CLNYPZWjpzfKpF8cNNUJr43
	nwziEEmcjkYZVaXsTf3fRRjYkmlIw1TSS4nKGYuZF9zZMib1q5LH
X-Google-Smtp-Source: AGHT+IEAZdmadmtlqNJT0DdlQkBf4IfmFoc/IRSry9cgLFX6xq5IoETw0+TLgbp6VWQDYULteetUxQ==
X-Received: by 2002:a05:6a21:9214:b0:199:d9c9:2b65 with SMTP id tl20-20020a056a21921400b00199d9c92b65mr3518060pzb.55.1706753157208;
        Wed, 31 Jan 2024 18:05:57 -0800 (PST)
Received: from dragon (173.242.119.193.16clouds.com. [173.242.119.193])
        by smtp.gmail.com with ESMTPSA id h3-20020aa786c3000000b006ddc30172c7sm10512734pfo.30.2024.01.31.18.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 18:05:56 -0800 (PST)
Date: Thu, 1 Feb 2024 18:04:47 +0800
From: Shawn Guo <shawn.gsc@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: shawnguo@kernel.org, xiaolei.wang@windriver.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, marcel.ziswiler@toradex.com,
	qiangqing.zhang@nxp.com, robh+dt@kernel.org, s.hauer@pengutronix.de
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm: Align edma3 power-domains
 resources indentation
Message-ID: <20240201100447.GE463595@dragon>
References: <20231214194655.608902-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214194655.608902-1-Frank.Li@nxp.com>

On Thu, Dec 14, 2023 at 02:46:54PM -0500, Frank Li wrote:
> <&pd IMX_SC_R_DMA_1_CH*> is now properly aligned with the previous line
> for improved code readability.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied both, thanks!
