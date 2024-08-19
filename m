Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F2F1DB435
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 21:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724103425; cv=none; b=Akgg4ccSV/NwUf/roj8m00NrTh841po8PpkZIBupltY1+RyTnP6b3P+wWgLV+Iy4up2UeuwG8+SuKNtUQJkjWwI9xdMqLZfj2smSDLK7OlbcJkN7W4/xxaLdA+2x3BMbE7q03ErqS7S6Lq40ZQnnYYF4Dowsuget+NJ+YVEuBTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724103425; c=relaxed/simple;
	bh=ZhlxgUWZA7Mzdd4SO9mRlaORtWiZzjROZug9lz/RMtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBoJek4ynpOt8ebLcDbHvxZA7hgq3XpXc57v/WUd3DYvhQNVUCWtleG5hwUfV5idTHsuY6l9dIy63YozqVHSgdO+jSLAoKBHm56o9Hpgp0+DpGC+GD5fjTXl9c/Ph5kpIx7Ea7pszTMDyE9v64Xb96b74gdHj38hOb5S0xPpFXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAJz6upX; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAJz6upX"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20230059241so12139185ad.3
        for <imx@lists.linux.dev>; Mon, 19 Aug 2024 14:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724103423; x=1724708223; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbFmVdZVt1jZ2w7ablB15iTS/AnL4wG1tnrAxNIbA+0=;
        b=QAJz6upXJd60tRGgWmdLIAHUHwe8/MAQUXWsCG16vG2NmB4smPTsMCEiY0qjDstRXR
         PJlokCqrbgeWLZZfWlZpGJuivyVeNTFMRB9sH48CZQ1OLAVTRUszPkwu7IsHRYv7YxDl
         FhBGsueCKWTQPScOuht6GZbpkZ96xROwtiwHQfM2kGUOs7Thp1/bUJnAC4LkQZ6uu6mT
         td7lDBbASQvtTm9WAGhWG0b19Bza+pG4YEAP4NcAKzNt+xuldd8dLQzMTLwh9GqZFgxs
         q9ZDnMJviB3iWMivpK5zD8mylTZuGg6ZO4IEl6PzL0S0qHDCiNwYUTP0MPvRV2+Fsc64
         PaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724103423; x=1724708223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbFmVdZVt1jZ2w7ablB15iTS/AnL4wG1tnrAxNIbA+0=;
        b=SNsE2kvrE158oGzJJ26bdqqF8BmvaJe8gOvnx1vcBAuIB6EOp4F0IA9CibtC+ATuu6
         DQKuHXOF/13s7ol5sVXXsP4Txq8bmuWAzQWl4LWz7i1agvpFw3eyDxibFcM9Asc4F6CX
         N23DV40HgyLCqyXj+sByiTyvpIPBSXW42wZ6M+neUNEXDZ71MzaDqNuSu3ebB15JKORp
         vH5Y+ftWO+IB/Fi7m9PwQGmUV5P9uJumVDGNE833bEVlwkdCPIzhJpZbRCUz9+NlvPQ0
         GpRU5TeN0AdFslXozAyVu8L05LLiG1ejrlGp687Xyiw10EYb4upDoasbxO51A81Ccxpc
         rpFw==
X-Forwarded-Encrypted: i=1; AJvYcCW9xCKUqG9Vu6bc169dtbQrEWa/hMibvR2H02uqg9yR3NA2AmFxWaTII6BymotSY9h02Pww+3hxcMVjWlYMK8OgIxhd
X-Gm-Message-State: AOJu0Yzelgpc9wIvobKk0Zpln51/FxqPX6imPcCRw6XGVrxlsqBFbrwi
	I854Dwc9h2kqZVB6TgbRC4jzYZbqmOy1GrDufrF8SwX+B4Y1L5zV
X-Google-Smtp-Source: AGHT+IHItFcJqz4vPegw9f19DaR5lvqG3jsvTuiwi2TkotQDaaEWjcFXJm6BiUuo7uswJ0PWg5G0RA==
X-Received: by 2002:a17:902:d10b:b0:1fb:6d12:2c1c with SMTP id d9443c01a7336-20203e9b06emr88206325ad.19.1724103423231;
        Mon, 19 Aug 2024 14:37:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f031eb50sm66377835ad.119.2024.08.19.14.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 14:37:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Aug 2024 14:37:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Li <Frank.li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: hwmon/regulator: Convert ltc2978.txt
 to yaml
Message-ID: <e63f6e5b-09a8-400f-8425-8dac4284fc9d@roeck-us.net>
References: <20240819190652.373222-1-Frank.Li@nxp.com>
 <bea0d3be-6b2a-41a7-8644-44b17d3a26dc@sirena.org.uk>
 <ZsOfeimD94+mh5gt@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsOfeimD94+mh5gt@lizhi-Precision-Tower-5810>

On Mon, Aug 19, 2024 at 03:39:38PM -0400, Frank Li wrote:
> On Mon, Aug 19, 2024 at 08:11:46PM +0100, Mark Brown wrote:
> > On Mon, Aug 19, 2024 at 03:06:51PM -0400, Frank Li wrote:
> >
> > > change from v1 to v2
> > > - maintainer change to Mark Brown <broonie@kernel.org> (regulator maintainer)
> >
> > I also shouldn't be the maintainer for this specific binding, it should
> > be someone with knowledge of the devices.  This is a requirement imposed
> > by the DT people, I'd be happy to just not list a specific maintainer.
> 
> I remember 'maintainer' is required property for yaml.
> Look like Guenter Roeck contribute many code for this driver.
> 

Yes, but I do not maintain code or documentation outside the hardware
monitoring or watchdog subsystems. You want this file attached to the
regulator subsystem, so you'll have to find a maintainer from that
subsystem or sign up to maintain it yourself.

Guenter
