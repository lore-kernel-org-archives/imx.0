Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233471A9B3E
	for <imx@lists.linux.dev>; Mon, 11 Nov 2024 19:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731353012; cv=none; b=KQ/bTDaXuhAUDALsUb0U2EyPn01FIQKC0MUIpieF2I0f+ljaAn5UGj1sEq7alHlZiQI0e6l/df9AOZPJo9bn8feGC656u3JMC3W0pKSRhUsOHOJwqqQypfVtEkoM/+RgvuQNLXBFlxINulK+G75vLH2eHW8UMMcyp0EyFxp4EYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731353012; c=relaxed/simple;
	bh=ANE+3Z4Gyg1tlcJwOYEwYd+wJ7Qoc7aVZQor/12U2H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUWG8q5z6hCaZ+mfXhb1wDrTpHMH+AjxAfQ1MKJEAf95qb5WA8PUyt0jHvNEZiBU6SkXaAeevZIvqNFjapB5OIQJRJ+l+s1numkMRKtun+T2t7XBKRCD1tWvTWH7FMeUYI7QdCqgBeyb0q7lKU6eaHOkKq3LcCvAGTjLdDEmrLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ht8MqcWw; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ht8MqcWw"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-720b2d8bcd3so3862324b3a.2
        for <imx@lists.linux.dev>; Mon, 11 Nov 2024 11:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731353010; x=1731957810; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OG1vbKR+3pDFc8nEwm1ZvVOlqvzLfcT/ZGyivy84CdU=;
        b=Ht8MqcWwR13rZkOjgviPOdZT3psrpzjjaeKTN5kdI7OILClHGWJ1dDRnHwnWWS0Q/r
         HZ/iqIO/SLqhoYaU6+xWeekAJpwLH4leEWRUp6vUbQ2U+FCiAdRW4enuoZSeyichYpFb
         GcP7EWtP9/7cxZMo2VG4K+MUjKN7IMcJHxp2eMT/5HGUgexoEB/ECLLvUMCMYFP3S3pB
         8ujWJNDwCCRrv+S6ea6EqS8FlzVe42WtiIplFOLD1WFc3fOfNBXwvfmgiHIfQkqckBDP
         vpfNhXp5R5lsFsSF4PGY+L5mtnEQQ2bHb5Q9sq3MKQLJzu/zLmWA8ji0qYw/PnIyypki
         2gDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731353010; x=1731957810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OG1vbKR+3pDFc8nEwm1ZvVOlqvzLfcT/ZGyivy84CdU=;
        b=AeRRnhXKOP1FO4fFDGJ1s5vbIvL2LjgcZAILpjK8yiMKHU670GcUZjnheTaofhLI1G
         bqI8RT0G80g7FIyqPMVgaBdEKxzj0VH9J5Vi63Upu82vcQEGneFZDeBts8MpxOuCbE/S
         QEI3EizC/w8XyPwPCVO+A2F4Vmg6tbpH9Ef5xdvw5mpLL+phZ8TByz3zSSGla+AUbyNt
         w3MkWCfhnYrQhJSfFC36MAM/QNpf/N72UDry99qJyq8kJeEjDNaDhmV/+DiTNToSQ1aQ
         u/KIxHxjgbFE7tZaVETuMYi06IH2soOcolKmWnnM9znLNhKJc9jruBcLlUidWujEFSAE
         9jzg==
X-Forwarded-Encrypted: i=1; AJvYcCW1u03qrSXw1F+uC7xKfXfz9ttTHIXlVqZScOFAqfUZryTv4AGqVY64jB1uJjN837ER6QY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzO9Uz4+f8dQvLdYo0Ar5gfpUopd2PXM9NzuB2iH8RZ/6gbdT23
	Msp0B2HHVBq3noDxN0Mb14g2GGc+tZ/CtVYzi6k0+ZVFMK9zcz3n
X-Google-Smtp-Source: AGHT+IEOXb9dMYWoaOSDkxeJwpcmRG5zOxNUAn9W/2lBSOlh8h6XPV9j5KFH5WXswgBqfSkR4E6eqA==
X-Received: by 2002:a05:6a20:9150:b0:1db:f89a:c6fe with SMTP id adf61e73a8af0-1dc22b00e61mr19740459637.32.1731353010371;
        Mon, 11 Nov 2024 11:23:30 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f643cddsm7591486a12.54.2024.11.11.11.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 11:23:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 Nov 2024 11:23:28 -0800
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
Subject: Re: [PATCH v3 2/5] hwmon: tmp108: Add NXP p3t1085 support
Message-ID: <576b3e70-9c09-4d8e-8b3f-f98a801b20dd@roeck-us.net>
References: <20241111-p3t1085-v3-0-bff511550aad@nxp.com>
 <20241111-p3t1085-v3-2-bff511550aad@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111-p3t1085-v3-2-bff511550aad@nxp.com>

On Mon, Nov 11, 2024 at 12:31:59PM -0500, Frank Li wrote:
> Add compatible string 'nxp,p3t1085' since p3t1085's register layout is the
> same as tmp108.
> 
> The p3t1085 supports I3C interface.
> 
> Update document tmp108.rst and Kconfig's help context.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied.

Thanks,
Guenter
