Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7755139EF19
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 23:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777590798; cv=none; b=pJnIQRxYTiszwdNtzMG2yp8Fy57074TYaoIvhLU+P6QvlKmnijlqHkuW4ySpsgzNz+zuCVA2KbVu0bc/7onuMJyssIbDKGKA5g+6Av+nmM7es4wN6tfegilIW6L6+JEhLKXgjmqX9Oppw5arKTM/+K73nuWuGsOcLPflv7ONk7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777590798; c=relaxed/simple;
	bh=dY1HY9JIF8+lDEBooYfgHkN/XI0e+4h8UH4v6feKDu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXPxnDOHlADs6LqcYP3d7iNSH1NcQey/knnLR+Qxtr9GmTArp+VEWHVromfk/334PFavnHfY8gJfxJ9OQRYC3y7RZur6lwisx0aV41DBLd0oZnxChCw0gwBUkH0P7xNpDuK+3ULoHnzPtpCndj6vpjUhjj7sdAfqp65xOjD/0pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHkcZfgf; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHkcZfgf"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82f943870baso697098b3a.1
        for <imx@lists.linux.dev>; Thu, 30 Apr 2026 16:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777590797; x=1778195597; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRfJ91dKSszpfdR8DuR6IPrBqkdsGBVokk2DQ9C/ack=;
        b=aHkcZfgfOU4BBSjFb3Ivsx8DFW1pETIf0gfNHjTswOA/Q/rgJyf4YECoXU0vSsxAAs
         4q3IImqzU8ehAOJbUixBiUO6eITeVpetWlEi5g6d+xfshLm93B20H+gHuf5yRBZj7H4K
         QR/mZKymTjwfCUM2fcQwqic7hY+166+f1h9auuMBPX8B+0OkHcNCHSE0yjnKMGTWy/Xj
         ueKpQprQ7R6utzQtork7+TrGwV/v1W3r20L4oa3WADHvelvmf12thz3PUS97KgbEiYrq
         4H29OXUyZncNWACqjBtSyc0mKfwzFdCqlkO+wl8o8nb7Msa+Q7MwEx52ah2xHNDTniRc
         uwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777590797; x=1778195597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QRfJ91dKSszpfdR8DuR6IPrBqkdsGBVokk2DQ9C/ack=;
        b=leJxZkDVpLRw0xFiFKLMy2KBo/l1uQbZtloemP7JCb+cmEMNxv4WtZb2xpzxz6PuBc
         OrGfOUxXWubTa7bDso+qO9C599LD3L0QT84VW1uwqu9owgNT8JlJ6VRERXqPJOTmflZy
         FDGEuymJIoCQMThQV1pWqn2WjommvPARhIsbER5FXaImb1sX9893YGY1OpM9heabxx2z
         1GnvJQslWfKoC7eeLlsGMl2C9zXRYxuvOA1j4d6YA91+WwzPsEVQTg19oa50LlrcYwvl
         AMaAN1cGrY2j6H7jO6+xH9E77VtaTMcexAyJKTW0PfrvBg5kyHEUcCL5N0MkgyqugxSR
         Xu3g==
X-Forwarded-Encrypted: i=1; AFNElJ+XmI7J55pjIRFD/6OudCs2hLdFAOtsfZ5BgmyxF+gexBp3b3RznokVCXWgLorti6rLamA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCi37p89rsCfi2/ZvFLdS0lw35Dn7eOIbHsN0Lssm4borVs4GA
	Y+TW1hjJ9sOLN9HfmUFfhvGU7lSxY01sCl6fF8NIjcCy/ONmMVhHQImk
X-Gm-Gg: AeBDies0zxXNZJN2fLIdZbQbDZtCHD9cySPuX6KGEHDwHoiA1Q/e0XPoDUeEhAPbE8z
	tZxH3+o422auJR7XzuKroDQMxmrH2aTar5yddE6DhcJ4cOHxDvu9z6n2aCsQyUKahotkEVn1kh7
	kEN7i2QCg9SPcTbPypbl8E45K47m3VhfnbxegU92iDusoyt4AHhTWh82LcQ7XmfwvAv+RwDOWcP
	2jYFzndc5oZJ1s9AgobH6Y5///hBj/EwEIpS0z2g8KZ5D3zcePe2PR0fVu4KDQsHFtr903tirat
	h4vdKqzNFZkTxvtp/2QhvnpTfIckUKGp8qi2wco2/RAnvNyXND6y+LJQV+twCFZEMouE1RsoglN
	tO8KYPqPHdLMNgyKRUYBP1edvP9X20/L5QT4a81japtNbcN7i97/RBmp5XexJkxx31G2g+/PUj2
	HAnh/c++hGOkj2NiVsdnwJzfoks0Spv8Lqjy3B8/oDHGVRxuM=
X-Received: by 2002:a05:6a00:430c:b0:82f:5576:2853 with SMTP id d2e1a72fcca58-8351a59ca27mr541087b3a.30.1777590796764;
        Thu, 30 Apr 2026 16:13:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad0049sm787335b3a.33.2026.04.30.16.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 16:13:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 16:13:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v7 1/3] hwmon: emc2305: Fix fan channel index handling
Message-ID: <2bce6b65-d09b-4237-be0f-3b53698d8031@roeck-us.net>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
 <20260429065955.2113012-2-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429065955.2113012-2-florin.leotescu@oss.nxp.com>

On Wed, Apr 29, 2026 at 09:59:53AM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> The fan channel index is used to access per-channel data structures.
> Validate the index against the number of available channels
> before use to prevent out-of-bounds access if an invalid
> value is provided.
> 
> The thermal registration path currently uses a sequential child index,
> which may not match the validated channel from DT. Use the DT "reg"
> property when registering cooling devices to ensure consistent
> channel handling
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

The problems found by Sashiko are real, but they are pre-existing.
The locking issues are pre-existing, and data->pwm_separate is for
all practical purposes always false (there is no upstream user of
the platform data, so it may well be removed), meaning there is no
separation of pwm channels if the thermal subsystem is enabled.
Given that, applied.

Thanks,
Guenter
