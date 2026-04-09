Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5B2382399
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 07:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720930; cv=none; b=N8jSGriy1edsmBJE0rQ4PMYx6/6DO+r8SI0/7Dj+RA/p0TG/nivTkX9KADgj9RUDcHLzVjZFyRD4cimHiAK6O2xU+iksBHWUSGeBHg+fX8rMwFRs1OQqYjoC3vzmufyAsQfuLwFTmRKUV6PwErf83IHfgB5/F7dFa6ZiBxwuBzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720930; c=relaxed/simple;
	bh=CNFB9BCmZvykJHd/6qFTyqv7wQ8Bpi9RiQylAO3FZNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/OeN4QB5bEACAmhnXXQDSOdzhLviuTONYvLb6ahR9jL4qY42uNMiBV1iijoYFKOVuBU57jJEe/gSSsmL7skowA0NJRv5qYjKTDP7tjFGfc05A8LIWJ5DEyzAHlwKkpYX/vTJ9uxAqFf2hc1C4h9IaJD2uYAjRBBDqH3pkHE5tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTxEGZEf; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTxEGZEf"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b949bf4easo271804f8f.0
        for <imx@lists.linux.dev>; Thu, 09 Apr 2026 00:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775720927; x=1776325727; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rxRaGky1PDExK5cCBC91gIZwwHEAgwUQ6PW8LpppLKE=;
        b=XTxEGZEfvH9sXNWXEfhTMLz+X52Ty4HJamkJ2bRp04Q1IhdvcDgMMkcDfPa9RV2r5X
         pnleZ+HO0UJjRvcxUqw+3IcVIOi4z7TLcfXPSgt3anyzccJIWfmXhQutMMQJbFXhqdQ3
         REgoQwVHxqb40e4H8aYAApyDyLQrRXo5T/9QnyH7mAcU1JPyLPkoITiOmZJeWkjXn59Z
         I5gpdALk8huxcZDo6ORX1+Z9WZPNVMSx1R/VeumLam/oKuylp0uXY3YyxXZZSBI5uP2y
         FkXgT4qY1PbuOZrfq6GGm5lCSp8M2l3XFd00cPYiGVMmUA+pIm5BIqH8L6xjE5ndf/n+
         wwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720927; x=1776325727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxRaGky1PDExK5cCBC91gIZwwHEAgwUQ6PW8LpppLKE=;
        b=frImt3lEr1Uj+0kqXBD2kjBkgJ6tNO5/SJt/zwO22dr/gVIn2bjNeFJcTiGWJTDc6X
         MQMkfP9BASXs3Ni+2aiAdC4Osaesm7WWo6RNf7Se5FRPEeoA+AfXxKTX1KvwayCYoMeS
         9exrfzfQIRrnpXUaF4k5+H7U8OWnrnNN3LYKjenATgkSUkNJhIcJ5ewVEAtLGgjR5Udd
         tFG8qYmD0LKh6i7sdxPM/+Tk1OCrLk2fZnxK/MNUzRgd8Spm4DZKQkDjEV4UHOX2BVE8
         cx0iBBWGoWdXP5PGw7wgDVr2A9MGE6wH4ZdUuvlsV5ici3Qbydvas0dJjNf3P+gXxAAo
         +i4w==
X-Forwarded-Encrypted: i=1; AJvYcCWlaNm1GSw/xUCF2NbVgd7oEEaLR3zh7BV+iM1ow20JmHX3Mq23khGIVBHC5b9MQ7pYBE4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhGDh/+EZvkH5djTC6AoL3cOSU/jiSBlbPE+eD0pT6MZb8R/LX
	ULtbUmPn8Fj81ro3ddfCyTCk7bkqHraYl58yQQXuCObWutFDbdY1bBjp
X-Gm-Gg: AeBDieueIRBT9qwWNWGgrguvuD88FYPXsZ/CkSd1FIwBLHRuFxTZjrHxD0pqqor3ait
	ZxxMPCzA1lAZBvxtbCeseeouMUzDPQ8lUsm9UcavSJYImrLrOw/CNLxkKzTB5eal+yx6vidPUeK
	BEgeqRPK/i05AcO+1goc6383XAPIIk3hD+cklfdx0X9uQxK7vji02esWpAhM0gLn1QBdLcPJfBH
	ZDHPVJpogWEAJR3oZFlUPTRJDz7GDlnSTL0ZQ0as6JjndEQqOs148cawpQe+QDlHoxmMyW5eTjV
	5MyP1y9okAOgfDEptnQJITgXjWcASAUIcwe852nWaC1n+s+FNIOg8jXqgMqZm7VSn/GY51up6TS
	8lCtELxShlo2O8hN1qSmllKpVfOwami9VdDXG0SYKI/I2qPCPVn5wuZd39lJI6r9G/2xcIQYUrG
	3y0tgdU2AYgCPnGAtfWfSeDPldUz44D45R4ObnXrW3CFTmovTznX91mXnx+QdkO7mtyJ9f9YP1N
	gc2Y8/BpHO2m8nunm7b5rjuK4NWHSInrWD4MA/HTBuqIUubxBzGQw==
X-Received: by 2002:a05:6000:2506:b0:43d:1598:2d6e with SMTP id ffacd0b85a97d-43d595bbc20mr3631331f8f.20.1775720926997;
        Thu, 09 Apr 2026 00:48:46 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f5bsm59805211f8f.7.2026.04.09.00.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:48:46 -0700 (PDT)
Date: Thu, 9 Apr 2026 09:48:44 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: freescale: Add support for Variscite
 VAR-SOM-MX91
Message-ID: <addZ3BNYfwIrFBuG@Lord-Beerus.station>
References: <cover.1775669847.git.stefano.r@variscite.com>
 <1ed7e2100e3feb74c9f0006d5b88e1bba1ad4339.1775669847.git.stefano.r@variscite.com>
 <adcdWdTcVR2T2F5c@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adcdWdTcVR2T2F5c@lizhi-Precision-Tower-5810>

Hi Frank!

On Wed, Apr 08, 2026 at 11:30:33PM -0400, Frank Li wrote:
> 
> what' difference with imx93-var-som ? Can you reuse it?
> 

The imx91-var-som is conceptually similar to imx93-var-som, and I used
it as a reference while preparing this DTS.

However, it cannot be directly reused as there are several hardware
differences between the two platforms, including SoC integration and
peripheral configuration (e.g. pinctrl, and available IPs).

So a separate description is required for imx91.

Best regards,
Stefano
