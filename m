Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80A7355F52
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 17:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772127905; cv=none; b=j/gkcHS0jNFkngordJVnM5QMD1mDXV6x62HKTmEgZVgiHiTNprkGvlgcL6agh0AjsPw6Hb8ioEZSO3Uk8F2rHdJkYAHhl/RI3xIr839PyhcmIGpzVDEc1AZi9cfFYTQR2CfSRNK3KTmTqdjASOp3In8i5z/SQtxzSjkgK+Chkyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772127905; c=relaxed/simple;
	bh=kweqCw7nmF7ZNGp7vL1pa93p5Vo7GbVX5Lf9kd9JOhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJkQzCRMzmZKFNZk0q0Nk9lWow1txFuKq/4MxrUKU3dmlJqfMmXqWf+E6Wuy2QTWLQriGoa6fQdX3wyvd+j+iVi7qSBn6V3buUO6KlqJ11hrCpKvIF5zqB9CKFF0QcZnCoEVhXv/jZXhjCZWaMgI02XmuJAxCKm8LyFXB2SFOjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNYAuoyr; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNYAuoyr"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b934fdced05so139902266b.3
        for <imx@lists.linux.dev>; Thu, 26 Feb 2026 09:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772127902; x=1772732702; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lwTJv9LGSAlffYlkadnvjA+g9OCfZ1CRMJttWHSXLMM=;
        b=RNYAuoyruXlm+jhpHB/w58k6xtxL3xOIu2dzXADDg/4jjNY9b0H2KIYKJX4m9p3Wua
         OSSldtbCxX0vFvQR2Poa9Pv0I4lPWHqWSM53BdUVoLQfUVcqEqOSrwVisa0GNESVUooC
         bLwnEpZkSv+a0NiBoIKMRfVHUPsSQd3iVw2mkByWmtIr+FUhKMu7P/CCmTFElZKbMJ0R
         f0CY0Q9J0lkNIM8kqxq6fm8mFaWFtnj5nks5wqLj6Kv1g6hYFl+M3X3XUu72G+FWvgWS
         TAT53MhsekeW36pJchwRmucPWCoFojuPluJDD+5siZuFcXXPPeB7Q0rcM0ZAQ87pL5J5
         RqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772127902; x=1772732702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwTJv9LGSAlffYlkadnvjA+g9OCfZ1CRMJttWHSXLMM=;
        b=a7kqymcHC0bq/AkbDqyZ55EmOdgnIScyxlO3mv8vuN8HbLtWAkN0d9SRhILAhzpo3d
         BTtWcalwgQVfhYeaGMCe9Mfeyb9GZgDkDBa8ryURgq4Mi+wOESEkUlEsWgcYbMVx55p8
         HHyuupFZDhZbCqd0u52l3IVNMs5Ktdz3QXLpNMUSeRfCYIjBlOH9XXCXo9JV0+5okmaY
         zT3M4+eI1gSdIbLrC5vT/nyiTR1IWP/4h1iLnTDabjm5lOZRg3DH0orJ+4FKb87fsDLH
         iaT9I0j+PhsWW/Q3pGj/n0pTQ/F04OlSP/afJ0FoY0fI98R9VGE2NMRbNhuU9Vqw+BR3
         Houg==
X-Forwarded-Encrypted: i=1; AJvYcCWBYtsPKpeYZTVLq3hAiXMRzaBguKTPNNg++v770Ie+8aZRW63wiFnXf81e5TgXSqgu9DY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeGXRafjym1lYLXembvHSDAze0DV0Dg9/KzdEqJsK/SamuG0k+
	moMyIukKQyZee0GPjc52gpgZvx8bBtfGoZ2oQ82zS3KUJx9BdVVEbsQp
X-Gm-Gg: ATEYQzw1JzJ17CttJywI5hHjtMBIek7iDIcQcYrrk4BX5VliRq3Hn240p/mVJF0pTSo
	v0IJboGrbJvn2+gZ5amFhDAU8nh4xvECGDjQCiijfmRBGKi4whdwns0bnVDiOPYDi4PljLUYjD9
	GYSydEmQN72JIw6GinTf5gOxTbD8+0pgs7iOynGt4PW1/2cpnDSaU8xwN9Zh8fbF66Oe2dia6Bd
	0BRbD5qPL9p4bUHffNwn9w4ufQ3kCYqSb2hM+A2YTOqxj7R2xkiywLtxR9mL4qpatkHk1hOBTWT
	6GAh4ZWVHbYXJ8bwKsf+uiK/rjsKrqSaeXr/8US9TmFiJ6zfekhY0/8XPPusY/k8XWlkXh+eiKw
	jBcN+vNIoW45zlMaTnbEClU4COzprZtWFtMz5EPSi3g7hoBG/ZtdCEKkZpjqKI9PByUnwisQdMo
	FoFHI1CmANB2ISYZk7HYovYxQ6Vo3faF1ZG8GYkzCH8cJUZkvHEgRfaYMMSQsCjOZ6ri5OGv7LO
	9cAQEokQNFG2TKbHl6/aTNO/1WXvJJlcfIDpaD6i4VXTpw=
X-Received: by 2002:a17:907:f497:b0:b83:32b7:21b0 with SMTP id a640c23a62f3a-b935b502ecamr191281066b.17.1772127901905;
        Thu, 26 Feb 2026 09:45:01 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab13564sm81364866b.9.2026.02.26.09.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 09:45:01 -0800 (PST)
Date: Thu, 26 Feb 2026 18:44:59 +0100
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
Message-ID: <aaCGmyqONKj7GoOy@Lord-Beerus.station>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3e79c4d806b8b8024b71bc99c36b09a2fbb90a65.1771353301.git.stefano.r@variscite.com>
 <CAOMZO5CAb8738HdH49WcY-JPTzQ90n4Bnmyn96_3jfw47mxOug@mail.gmail.com>
 <aZTEm8nUUVcKZH0v@Lord-Beerus.station>
 <aZXqSz_OsCC64P7i@lizhi-Precision-Tower-5810>
 <aZX0WB_6qPoCYVvC@Lord-Beerus.station>
 <aZ28RtuAWcatyVAf@Lord-Beerus.station>
 <aZ4YdCIG2JIT6BQS@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ4YdCIG2JIT6BQS@lizhi-Precision-Tower-5810>

Hi Frank,

On Tue, Feb 24, 2026 at 04:30:28PM -0500, Frank Li wrote:
> 
> If can't auto detected, I think keep old dts, use overlay change to new
> one.
> 
> For example, board.dtb
> 
> you can rename board.dtb to board-revA.dtb
> new board.dtb, by apply verb.dtso to board-revA.dtb.  Or you direct use
> board-revb.dtb.
> 
> If change is big, you can create new one.
> 
> Frank

Thanks for the clarification, I understand that the preferred approach
would be to keep the existing Broadcom-based DTS unchanged and add a
separate description for the IW612-based revision.

My only concern is avoiding confusion in mainline.

The Broadcom-based SOM revision is obsolete and no longer manufactured.
All currently produced VAR-SOM-MX8MM modules use the IW612 module, and
this will remain the only production hardware going forward.

I would like to avoid giving the impression that we are actively
supporting two parallel SOM revisions in mainline, while in reality
only the IW612-based hardware exists in production.

For this reason, would it be acceptable to:

  - move the Broadcom-based description into an explicitly legacy
    revision-specific DTS (kept unchanged for existing users), and
  - update the main imx8mm-var-som DTS to reflect the current
    IW612-based hardware?

This would preserve compatibility for older boards, but ensure that
the primary DTS in mainline represents the hardware that is actually
produced and aligns with the rest of the VAR-SOM family.

Thank you again for your support and your patience!

Best regards,
Stefano
