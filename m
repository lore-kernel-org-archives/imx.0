Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEB13750BE
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 09:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701734; cv=none; b=qg/P69gu/32tFRYnYEEnoeyuJduhZaDpNlukqYYYqKLFj+HtQahRJzz2XdGTEgnUhKwd1T1dT/vHlar0i50VVt4DGz/HFN85B8/3du2NkRvxgaU0BwpMl3twwHyFVnnZ4CKiJopczCyJW6WIPHLJGDs5lUdG/G26jCRcdsIA0SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701734; c=relaxed/simple;
	bh=WD/1Fuhw7kTyLzZf1oRx5KLWdjeZPVoCTn3YWmum8Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSNDGZgL9b8KyCA+GrL/4sFVjD2vLY2kHdFgwc3DM/D4R0GJm9JpzhTXfAMsa7O7hVLwWHPyQUmKIE7joo+kLYxzLlRno4A221sY9CUan1U2CqfVyOQWO3dspUhf7x8FGDsqg6q+zQYffITVbf7+a9fsagIVtviKT9SnHWtojqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P311AxoK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P311AxoK"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439a90f194bso3935513f8f.0
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 01:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772701731; x=1773306531; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HdgzADYdSTQF3KpHo8SgQF1RTtf2xICHD/S64SaK5OA=;
        b=P311AxoKnuqjyxGN8UVoa4Md1DAG8W9tcIGvOW/9F0xMPXocO0S1xXmzNcQE43wH6e
         QL44Ok5iMHfJ1pbZA4fCxolkTSJ5EXgOaFta4TdBpwS/Z4O4cNFThOwDqZFDtOoL3VLj
         qIkhGZWPV0XmT8sRuFxoIf0z5g8Iwydq1MfH3zvbRTSc65qCk9HG7+zLc44HJlMsp0Lf
         A8okJPVGfHJlqpBrh54RbZgAi4ryrB0KIjuuxUsqk0B04N9aTBS9ocOV4uC8a7vnYJ03
         F1Bz1qNODs8N21cC32dV8y7NIi94fRhFOHr5lkA2O4zAiuobgkZVkn6wAiJ/xQMffXaK
         CQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701731; x=1773306531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdgzADYdSTQF3KpHo8SgQF1RTtf2xICHD/S64SaK5OA=;
        b=AaALnESm8YriZz4TuU7pDz8Wn27Ueuv1jbvunpYMrILCE+ovGUTupUHZpduFaZY835
         ytbn6BCKMaF44dgMRJ/588xjp8Zrl6ger69SnFFdmc3rU8zC1+xbJqTTaUHLtJ89TgMr
         VjKNel9j54BtLThVwcp5fXc2f0nrYneDRXCdMEVu/SnsuiL5yw2YNYEiX60QBexY5ZKx
         4Q5JuHWaLN2bq56ONJbX/lil9oFgwYyMkN5CHfqCFL72uovv369r5nwfvwfYpn62WGEb
         91ye+zV1nctoufVYk9CgXQ6zaTCVh9J+i8daReyaxoA5oU0pzAwYQtW067TG0J8y/5IO
         1KcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzwX6y9pyboRgq5EadJniC19OgG/LbRMnI3MS8rxJ2X6m6VBGhKFISdVju+QVu5BrfVRQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz20Vu5WRp2QLkhxHgWrrUc7UbH/L1m0U7ftgrC1o2X/I/ztxqZ
	qifE0d/4CRurTIhjTEbJH/clFp4BhOBmja7PerrPFtN5v+IFiBo98YkA
X-Gm-Gg: ATEYQzy0bhTp7NIRu1eudbi6PIlrdJvSgizLfjl8VzguAdlPxBmtgeWxgdtyfs7afzC
	xsC2HN/iG9SthjqRqUgJEQdqEWK4nuF8HNOslijzGiqWrNT8FNm7B+aOurjuqZifhuTZLngWKpR
	ijeWz4wEOUDCgu8Ka3C6HHtw+EY1/a3zgah9eFgvYpP5OMY7LmfMEUzfhglqbJqw+9xTRzZ31I3
	sd+qqAO29JgkS6JFtO7yHni/myd9LPGVmKKNyqKjcLLIB8IxU0HPkkctVb7wTy3bHCytjziPtL0
	g1QFFvrSDMpXe8qi8MLby0OXpYHLUzYNmd3vTeOTMD55zf8ASq98dzzbVNMAZOp14iUjE21UuOq
	qv0kaTGstzVDvNoxAjaf2SS6x79q87I2U4uM37QLGkv7nowkaG+5AIaKtLJYwbimf/5XWBQ3VVG
	AYGuIXXQcAVpG2/oZUM3wrYEH/jWopsvlSQDHiNhDRhmI2I4if6Km4ckIrrp9YCRHVV6MUvEJKg
	brKqfm+iyvKn5d+lGn1ZkppT0MhOOGM5jluupSJH1i6SLESWz89lFF2SaICTJ80VgYxrKLtRw==
X-Received: by 2002:a05:600c:c173:b0:483:acd9:bd18 with SMTP id 5b1f17b1804b1-4851983b401mr89134325e9.1.1772701730851;
        Thu, 05 Mar 2026 01:08:50 -0800 (PST)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb33815sm52248885e9.12.2026.03.05.01.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:08:50 -0800 (PST)
Date: Thu, 5 Mar 2026 10:08:49 +0100
From: Franz Schnyder <fra.schnyder@gmail.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca, 
	benjamin.gaignard@collabora.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, sebastian.fricke@collabora.com, shawnguo@kernel.org, 
	ulf.hansson@linaro.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, m.felsch@pengutronix.de, fra.schnyder@gmail.com, 
	linux-imx@nxp.com, l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com, 
	eagle.zhou@nxp.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: verisilicon: Fix kernel panic due to __initconst
 misuse
Message-ID: <cq7xvy74ore4wqkdarf2p7tgksrmfdaysajqga5ymrdkklwa7p@nrbu52d4gxe3>
References: <20260305080354.639-1-ming.qian@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305080354.639-1-ming.qian@oss.nxp.com>

Hi,

On Thu, Mar 05, 2026 at 04:03:52PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
> 
> Fix a kernel panic when probing the driver as a module:
> 
>   Unable to handle kernel paging request at virtual address
>   ffffd9c18eb05000
>   of_find_matching_node_and_match+0x5c/0x1a0
>   hantro_probe+0x2f4/0x7d0 [hantro_vpu]
> 
> The imx8mq_vpu_shared_resources array is referenced by variant
> structures through their shared_devices field. When built as a
> module, __initconst causes this data to be freed after module
> init, but it's later accessed during probe, causing a page fault.
> 
> Use __initconst_or_module to keep the data available when built
> as a module while still allowing it to be freed when built-in.

Thanks for the fix. I tested it on our Verdin iMX8MP hardware.

Tested-by: Franz Schnyder <franz.schnyder@toradex.com>

Kind regards,
Franz
