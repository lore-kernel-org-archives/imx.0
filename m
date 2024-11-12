Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B17A213EE2
	for <imx@lists.linux.dev>; Tue, 12 Nov 2024 17:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731431484; cv=none; b=G5fsn1oPOl2fUa4Ci+BI9kf+cIne//5+B8YpKMbEOl9PnnQqg9y448TLmmCW/AtruXg+tDzqxBYxxu+vHMALnbdlb4rlfmwGW2g1K+zNtsGcO/E0AJlT6lD7KynxEjSXnr/H0nUne0YliFhDfjocpj9qom87LQOlo6roX6/Ezyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731431484; c=relaxed/simple;
	bh=9qFLxQuXAwUMz3A693Ta0zMDeVFkOg0P5FQheE/cQmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EuclZYlKKWoiJP4Msyu/YXvSgDiG1T6ZlQn+g0JbIAeFXD48DQ6gvpkrpoJjyt9t64wj/RaAt4Urnxac2ucMXw+0V07D++q3IffeYWFhdxD6YADSW5d4q1RKbmQBYG6qfcrIIFNf5gIOEScPO9BdMVmaUg22+5NW0+R7xpjt/tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/Qa++v6; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/Qa++v6"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71e4c2e36daso4252231b3a.0
        for <imx@lists.linux.dev>; Tue, 12 Nov 2024 09:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731431482; x=1732036282; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5c6OWgQF/ejcqVQp7h08DgprnfycsFPIP9B8O7D4XkA=;
        b=W/Qa++v67hyVZ6FUTKy1i6WsaewsMQNM1itvffbI9nIVXcDhFAAdhEvjMU07TxE3Nk
         MnpjT9AhhOe9TbrMS4nORbrzIlGR88t55IL4Qa29C4cdV8rt+oU9gm3YcfkbH47G5rrh
         Si+AN+20mLbWk9p1pxPSHKyseQf1hwFbkpy1kMOR5eZBb3jChBl4hH7yZw0CIc1Wk5k5
         6fvy3TXYayEMTISRAia6wqPPXQbHmbJWb82cWx5CfHwIJUU5FE3JovkOuZFY0z27F860
         eh5IvvtiKj/7sSNkiDhI0sbG/K1nfyk5K71WqiqMAzpb3HK/jP6D1dkjJoSJgjz9ROT7
         vWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731431482; x=1732036282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5c6OWgQF/ejcqVQp7h08DgprnfycsFPIP9B8O7D4XkA=;
        b=Z7g+4jko9671GtE9qQ+EqTFjCHNvg477uCSRn1DmrKNkLaZxxmWqelO9zngPjL0yvm
         Wbe03SfIFxyIK8/S4MIijKZRdRT7G3KXSqcZo2WLDc/z0zGF2pPj36YzbUdanutEr2Fo
         sDJLLIi9HZzr54X00VcHgZ9yTqTMvwj62AuyDeAsx+ze1RhWao8lcRop8PvaRpI8lqUS
         KZbOwXokUodG0u0WIM+/8uisBONZ5kO+ImB9SPVjNpB59L2t3J8XTXozRXp5r/NXIt64
         Bhp9RdtlVnzGNQGV6vh2ifVvU0jIYOipOz0gtQB3tAlxbAYhGIXYbgxxPGPWHsGVH4hm
         PaTA==
X-Forwarded-Encrypted: i=1; AJvYcCVcCDinzuieJ6xKKZpDp6QpEZkJbbVjEVJEgMPq3d2sK8GSpKNHd9/0bgORikOvmVkkWjI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWAvLec3pZ2UXb4plUFs9GIBF0nZu0Qq4x73uOC5mHTNPRWx03
	lQrsh5kMLewaz4pDAXPxt+6RkTWD/7Ss7PIyp7zK6qTWGBkAR0fP
X-Google-Smtp-Source: AGHT+IEB0XmDsy3B10i2uTRC8VzGGRmiDyjY6Ju3LHYSB2QDsh3LoZZxlsq6FBHih7bSCohEPX+QNw==
X-Received: by 2002:a05:6a20:3944:b0:1d9:19bc:9085 with SMTP id adf61e73a8af0-1dc234afb33mr26913887637.14.1731431482453;
        Tue, 12 Nov 2024 09:11:22 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a189e3sm11424545b3a.136.2024.11.12.09.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 09:11:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 12 Nov 2024 09:11:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 2/3] hwmon: tmp108: Add support for I3C device
Message-ID: <860c243a-f6db-44dd-bbba-d4c01dc7f9ac@roeck-us.net>
References: <20241112-p3t1085-v4-0-a1334314b1e6@nxp.com>
 <20241112-p3t1085-v4-2-a1334314b1e6@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-p3t1085-v4-2-a1334314b1e6@nxp.com>

On Tue, Nov 12, 2024 at 11:52:00AM -0500, Frank Li wrote:
> Add support for I3C device in the tmp108 driver to handle the P3T1085
> sensor. Register the I3C device driver to enable I3C functionality for the
> sensor.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied.

Thanks,
Guenter
