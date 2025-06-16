Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867B534545
	for <imx@lists.linux.dev>; Mon, 16 Jun 2025 22:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750112171; cv=none; b=cSY4yDd9lwGCUmfPJGy4i8k7RONyotm715JgwyA+TxTcS5XUbYL4jbMgzKTlLJfx7XY0TT69/oVBNPe+JOVs6NcbDladdkiWqZYLAYFMrDJJoYxEqUME9EtR8e6UlsZNgUWr5PGXICY8CsELbn3f9852ofkdczgXOQEaE4YH6YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750112171; c=relaxed/simple;
	bh=ijhXuY/+FH+ilubfbP+vAqRx7K+apmTeIDWZZ1AOA+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=an/TOh+DR0ITYx0K9Lprl/t91HqWL7p7yYc/rpmYKWVgCJ8OVpd8XGYjzYmeorTwbg5LW+u1Sh9Wa04vM0FknKGOpl+gnH/wCbDFYplagzVAAzvXCu/e2TXIatxMu1y1UvsYizzUS30twbk9zPi5GqxoFubai+31znRLJGVo50Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBi78iCk; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBi78iCk"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2352400344aso45748085ad.2
        for <imx@lists.linux.dev>; Mon, 16 Jun 2025 15:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750112169; x=1750716969; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqzxOBMLH7wnd4MoqI+z4U0qu3t3OgvxHrZ5MX4ejcA=;
        b=XBi78iCkWkA/XcNGxxBHfkNoAJlsCo010H4glYhX+Ll5y0LQ3FJRiUYL0ndmTXLJ6l
         WUH7he9jBBda6xHhW/t2plvQ0UahKYsSt+wgtSdaam9U8moZ/eiCTW8Uh2TS+Oktcubk
         KjXitTEwWYZPmpZRNbfsR/D/lXjcRZLptdPe6ku3TXAAB8aQszjAwUvt7oH/jqe13OS2
         y2x6tHlbrkgWC3y55NSGjSfLHwgMXkd30INXT0SKBRBF57NrmG3b9FLtSRXXBaZsCF+l
         qbxBZWlrbfgzDCrDclM+MLiHfleHg4c78gokhMqwScqrcXKMnfJA0j7lR2b6thISM4A1
         GL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750112169; x=1750716969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqzxOBMLH7wnd4MoqI+z4U0qu3t3OgvxHrZ5MX4ejcA=;
        b=fePtDysUahQnMTGZI5PN/vgWjgA6qAMjAgXmt5VbJNYqIQd+DPl+zVBKZ6Rnvz9G1k
         kU023TQPyTvrHPcBXP+Z9GrBAslcatL+m7Bx8WpdtVz2keSuONmkmsC34NoD4RxZ4ThP
         BXKGC1RnQaicFsnDCno3sbCWSimM+sLU1UCweRGIqPNoevp1Ym+hSKAwS7lUEVIxMXAK
         M3szv28NSiN9MaI+zK0WRdyCbwxDZJqbfD12CyDAfPmT8DJLIi+7U8J6Oh6mLbswbsuB
         9qK1GRWZaaYCrJ/FZx5a+IVLcDLm6wmtPniaIX0Zoc1aZyzZW+9a+0RkMwe3Z1fKFYse
         gOWA==
X-Forwarded-Encrypted: i=1; AJvYcCVqohuIsjOM+l1YEY2uutOQ39dmQxg9GCsApASwGBSERS22i22eFx8ohdLp0Godpx49Gdk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvMosdMHzVxEIfx/bIW0PuuuVQkHK45LBu+Ssa3XalxFtPWkw5
	mt5UEOx37IKImMYHIph/uewY51Dps0ouRaf36dfOSOU/ZiaCEC7Gl1V/
X-Gm-Gg: ASbGncsOwggCqZckh2n8+bNAk/fmsIglJC4I+S1EfXAethJgAJfjrANuzOWdrJstYyN
	PomhcPgwlxpvPLqxQnIhbFer63lO30ncdJAIoAjD/rfeksACOHk2sHBKnqSug+WuG2hsfxNeF1l
	YFy4Q4uaVKXXGsPJh1f5P7+zvmW1KMNFenFXPVrxMmBb6xbn/Fi/wFk9jytGo2CM3jLW4aYf8W2
	3ouv6/7n79egXYZLTE/9BP8hVlp2BCmhUTQYH32gHhvfuUiOUlCXmC0axPWUiPzrkKlm/U0/LJI
	usxQz9LhFYGQNwV/rvvKMNmxjv3rC/XSArXFk/kKafu6Mmy1H4Sp2IzWSx900htIR31AsTkma8j
	hJ9pJ+kPlLg==
X-Google-Smtp-Source: AGHT+IE7D45OxaXOpEnSNmrkvBGVxdNdlxgSulu93jAwXQec/wc9R/9wjbBwJ4aaqqfW5jX8XSaVRg==
X-Received: by 2002:a17:903:320b:b0:236:15b7:62e4 with SMTP id d9443c01a7336-2366b1443c8mr181687065ad.38.1750112168797;
        Mon, 16 Jun 2025 15:16:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1639dffsm6286948a12.3.2025.06.16.15.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:16:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 Jun 2025 15:16:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>,
	Florin Leotescu <florin.leotescu@nxp.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com, daniel.baluta@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com
Subject: Re: [PATCH 1/4] hwmon: emc2305: Add support for PWM frequency,
 polarity and output
Message-ID: <d6a0d179-1fce-4b3e-9f3c-3dacf05cc22c@roeck-us.net>
References: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
 <20250603113125.3175103-2-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603113125.3175103-2-florin.leotescu@oss.nxp.com>

On Tue, Jun 03, 2025 at 02:31:22PM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Add three new attributes to the driver data structures to support
> configuration of PWM frequency, PWM polarity and PWM output config.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Applied.

Thanks,
Guenter
