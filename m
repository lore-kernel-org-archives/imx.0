Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4499610E9
	for <imx@lists.linux.dev>; Wed,  2 Oct 2024 14:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727880981; cv=none; b=HA1pDGW0utYx6xw5ZD3MYP8xxYTVuryEr/F7Ybz9XZNMwDpu+FzsZnabfKKPmsffrRcmlGWK5qfkAw824ex+yZGYcABnT8cPjdOOOVMYd5BM3eHkjQHkKfG5cFduXgAz74xRQ3569m7/6rGOft6JZvG+z4EjcjytdYJeyRFxtDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727880981; c=relaxed/simple;
	bh=0PMHnOfLINOpUpL5u52xj7l7dUhjRThgwDNabUf2iLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cD1NlWh9qraYN3VNk1PKnewogU2XMbWRSEd9Yf+LwhzJkVYfpeezX73+7nGEUEvgrRlJluK/E+UpwVOiKUusTg4G9Ejoq9N74sjik5lDJfdFW/fVJ+6hHmALR78Z8KATGt0aW+SCgZ7ctoVddpB15tM2k4hBSC3aVg54fmbCc6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Smbnnwdw; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Smbnnwdw"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37cd3419937so3589159f8f.0
        for <imx@lists.linux.dev>; Wed, 02 Oct 2024 07:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727880978; x=1728485778; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ArJKboNdEUouLVjZmQiavzaztbu9wUmpBbz3Qd2ETsk=;
        b=SmbnnwdwNkZf+4pIlqylN3AIc8rfwMvi/hsRkNNIv/oXsHTvDd/Fpe4/pC+FT88zD7
         vqXYKjO3a6fxDS02W7sV4G7OXRUxLu2mu7QBH1S8MQOdAvoA3LThvbKjoK9wsJr5ggJQ
         /Fe2++pzZyfnsJQ1Mm/55K8AosPq6xii348q7CR1/NVIVydhMD7dxw7LmdMGRAntubzN
         HS94wHi+SBpNr/ID/R87nW9ZZ5lz0/lCBOb0iakgWcqRXRCM0LblDINIypwpjRNM9mNJ
         J00nrL3nnr1/rUy2oH8Ypb4qurlVlBx1/yS+eBzOG00Q+gU8LWYITLXaTNLYZMCw/pLT
         XznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727880978; x=1728485778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArJKboNdEUouLVjZmQiavzaztbu9wUmpBbz3Qd2ETsk=;
        b=PLrGftMXG5k1q8xEDT+Udijf6I6QN6KVX+/faUlshzwjOd5Fz6ag/6MgyFQ9vAJnwk
         oiqkJj5dNIMkN+6alZx1cxxpW9EghVuFSzyzZqMD0VdZL1CCsAaWD80Syo8oh85CgxR5
         tOMsnmJv+qyhiZTrotstNJO3qTCied0qrgqXcOu4gVadR9ATTVqGN5rtFRzg8H15HXUL
         nApCjLxGhQ6HKsnWM92/yQ7oTn5EIhUuertmqZzTVQZ/rkxr4zJ15iYKDDIOKMMKYWzC
         t2jgMXIceMKbmkHcVPDWOMD7c6FL0e8Xx9judmYRjKI7QFM5MIzdSdxBSmxlVV/JNhlW
         0W7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3Dj3ht4AOpnPtRzDyiKKPWrIBN91thQJnTpSpGMxs4z8k0Goiy0s0xlznooY15GYl4i4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4+L7aRmpV/WnZf+c5qIAEoN7bQ+KsDszPtmVwiqO6mCg9IpOO
	IBBBrPlNlJnG6Pab03rllliK/kx+FNnGS3EPCjv3DOWayLJuoYsq
X-Google-Smtp-Source: AGHT+IFSuWZxPxnR/PCz++pS/3Tgv8+0dPn8oiXivA0TR+4KO3wJwURaFqD7P8uc0QGMdxkXk/UdBw==
X-Received: by 2002:adf:eece:0:b0:374:c8d1:70be with SMTP id ffacd0b85a97d-37cfba0a47fmr2127521f8f.38.1727880978326;
        Wed, 02 Oct 2024 07:56:18 -0700 (PDT)
Received: from eichest-laptop (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d5b7sm14222365f8f.5.2024.10.02.07.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 07:56:18 -0700 (PDT)
Date: Wed, 2 Oct 2024 16:56:16 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	Frank.Li@nxp.com, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org, francesco.dolcini@toradex.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <Zv1fEAFKlzNpmHnD@eichest-laptop>
References: <20241002112020.23913-1-eichest@gmail.com>
 <20241002112020.23913-2-eichest@gmail.com>
 <6378933c8d30bec2c3084e41c83b9d129d0d40d1.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6378933c8d30bec2c3084e41c83b9d129d0d40d1.camel@pengutronix.de>

On Wed, Oct 02, 2024 at 04:40:32PM +0200, Lucas Stach wrote:
> Am Mittwoch, dem 02.10.2024 um 13:19 +0200 schrieb Stefan Eichenberger:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > According to the i.MX8M Mini reference manual chapter "16.1.4.2
> > Generation of Start" it is only necessary to poll for bus busy and
> > arbitration lost in multi master mode. This helps to avoid rescheduling
> > while the i2c bus is busy and avoids SMBus devices to timeout.
> > 
> This is a backward incompatible change, as far as I can see. Until now
> the driver would properly handle a multi-mastered bus, without any
> specific configuration. Now it requires the new multi-master DT
> property to be set, which isn't even documented in the binding to be
> understood by this driver.
> 
> Are you sure that every single instance of a i.MX i2c bus is only
> single mastered?
> 
> If this is a worthwhile performance improvement I guess you need to
> flip the logic around by adding a new single-master DT property (or
> something along those lines), which should go through proper DT binding
> review. You can then use this property for boards/busses to opt into
> skipping the arbitration lost check.

According to the discussion here the property documentation should not
be added:
https://lore.kernel.org/linux-i2c/2bbddaxyjkxfmlgmq3yqcbzo7dsb2pq5bvdatk2y4ig4iintkt@35btqkdv7sy3/

However, the point regarding single-master and multi-master is correct.
We also discussed this internally and assumed the single-master use case
is more likely to be the default and that this patch series would fix
issues for other devices out there. However, your point is valid and if
preferred I can change it to single-master with the next version.

Francesco Dolcini <francesco.dolcini@toradex.com> I think you once had a
discussion regarding multi master mode for i2c on i.MX devices? Maybe
you can remember the details?

Regards,
Stefan
