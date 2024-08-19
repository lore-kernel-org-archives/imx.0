Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAD1145341
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 17:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724088115; cv=none; b=MWuehcPEtUwceSNC9aCpUEbKHGShC+pJ8MzguW875WziP1600nygMAtQHD3CDQO35/IUBSVkR0sTLv5yUeHLB/pMpHPv5fmDMh+KGKVTj5qbSZsD0+/KaizoPvYn8QM2j9vNL4xT59oYx/teGFi/BtX/2Zi/h+UF9SSaHgp/Arw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724088115; c=relaxed/simple;
	bh=Nmz0iBI3HX19F5MOevl1YOsm9XNiw/iRArvFfhyVwAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPFb+HPm3o0Yr+lIkWSSSNVpsjE7zyn2GIEfPbn3r+U0UNDN0ahzhz28PLQuxDRCYGd7FV/Vn36uzpoZOHq+EgRy3rZCDt+1hDkK6O6vT40CxFn+e6xg8bi9JnK9uBSAyGS6xb9CPx8s7ZlI17v80/4tlQiLFNY0c8Tsj++H2Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNkS3HWQ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNkS3HWQ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2d3b595c18dso3403988a91.0
        for <imx@lists.linux.dev>; Mon, 19 Aug 2024 10:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724088114; x=1724692914; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e1292ZXxDguRchN8qDs9u/NGX4Ml2NR0U7feEMuOmvA=;
        b=DNkS3HWQQWRZGY/9nuDXhDUYsxb2/HgxxC38EkeNQZ1xCOnnlhtjbkPhX5TxXb2hPS
         My3g5unQOsX1rK1uMlh1Yn8MyEMOUkVzQB9UnFdYWjq+dzzBPI8MbgHIO8DVNJH0pjDD
         +MysShE3cQoV+KockCUku5fwn3SXWCfQUmp3EvpCulie9twSE9bdzMM8w5wwB86hgn6f
         +YBioTU1Nr3F7G3OYDkpUVEUfBamAy7HY4viWYvGhfzIzKrrJJPSMHdNau09jEsqOIU4
         pfAyNLj2ehxEfsTGbry8M/qR5q7VE2FIGMgLMXXddomEJFXqYSSvYKv+Gn9Z0unBWAYV
         cofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724088114; x=1724692914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1292ZXxDguRchN8qDs9u/NGX4Ml2NR0U7feEMuOmvA=;
        b=tjh2/E6BckLOa8YU9a2jlSbkYlE4hfhLvKtOvw/dnNEG6xtg5Az/MA8Bw7xg41vyJf
         cey1qAjjPg1is6cxYirVpOMb7dHzuLS+VoarYWBYDtqyROVUgvLl5lS2TJHtakh4/kiT
         Alia9wLjzrieBB662FqMiZ1+zU90my444//fqYlekNtRpdyqmW6Q2vfABeSw7KDvvDii
         wplFBfHz71K8rCgGwJ8vmAdLZmBNagieW+NBWOBd/KAGiXJfCxkv9hvm7UcHfqxzLVXv
         E4mhZPZBfGmkd5M+pZBIQok4bX/BhaPg47n1JbJS6o2WIkAVXT72wfl/xvhJJtE42LcO
         EsBw==
X-Forwarded-Encrypted: i=1; AJvYcCVyq89y+ra9xcMSEjHKLwN01C8VvAkwDxiNhmN9qMNwiE610HoMHVXMBK2tUIE44lWKACMIwAzaJH7/snggmyc1SBdS
X-Gm-Message-State: AOJu0YwERJn0+kuKhA1Up3yi2aqWsq/DK9ViuWykU2X0DPIDn9FCYW12
	foJvPNwSGNsadSdEpDZm+oYTwTu1n3KmyijrS/XrOI/4j77Vl0Yx
X-Google-Smtp-Source: AGHT+IG1htEHXjCns67hpgxu3BGBDINNnCgB/XsfDFWkdFkrwwpy5jEpxxq0m0ZCRkDCu0CzR1ryGA==
X-Received: by 2002:a17:90b:80a:b0:2cb:5dbb:d394 with SMTP id 98e67ed59e1d1-2d4731ec386mr503184a91.4.1724088113566;
        Mon, 19 Aug 2024 10:21:53 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f80c:1483:bced:7f88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3e2f61fd9sm7602754a91.16.2024.08.19.10.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 10:21:53 -0700 (PDT)
Date: Mon, 19 Aug 2024 10:21:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sanchayan Maity <maitysanchayan@gmail.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v3 1/1] dt-bindings: input: touchscreen: convert
 colibri-vf50-ts.txt to yaml
Message-ID: <ZsN_LmeVJw8tyfMm@google.com>
References: <20240819142434.311760-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819142434.311760-1-Frank.Li@nxp.com>

On Mon, Aug 19, 2024 at 10:24:29AM -0400, Frank Li wrote:
> Convert binding doc colibri-vf50-ts.txt to yaml.
> Additional change:
> - add ref touchscreen.yaml.
> - remove standard pinctrl properties.
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /touchscreen:
>   failed to match any schema with compatible: ['toradex,vf50-touchscreen']
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry
