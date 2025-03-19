Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735CC10E0
	for <imx@lists.linux.dev>; Wed, 19 Mar 2025 07:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742367886; cv=none; b=jSHRczIMedxR64x5xfqILOzjxpQ9iUoQlwCDwpRbGDT0LoN4rGZweJrraXPw2pqT2DLOUtUUtduHfJPE3DNTeL9vopk/+Uu5JCrwOWb4WwdbN+obf8SUstnvpUL0fdM1oGbVhP7R1FcZsNIWQzZaFOHTCy9xK/vdTUV0GcsomoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742367886; c=relaxed/simple;
	bh=jiAfj4IElgBqEg5+PLChSU4IpIj1nxRfVkLGRm2D6Bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWXtT0NlLwitLQ5aTIahhbgS6acfTC8U94j9D/jRwBPeOefXN/LOp3RHAZQs3wjse6c4xawVTTiNjmqIx4nbwYVbYmc+dJ/yT+/GxNNzkuKVY6YGNtOZTr3312WGvPi+/Mb7BllDrr5xB6IR152L+4RQ5XM5z54Z+P+MrJv85Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QU3pJEBY; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QU3pJEBY"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-301302a328bso7382327a91.2
        for <imx@lists.linux.dev>; Wed, 19 Mar 2025 00:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742367885; x=1742972685; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jiAfj4IElgBqEg5+PLChSU4IpIj1nxRfVkLGRm2D6Bk=;
        b=QU3pJEBYNY4Y1AVcrtMjn8cHTwGIGKdW693HTVQgYAv7N+Sw+mlyLFAtwNiWmMpTHK
         VvSZ+m2pxmX+/3q5wI65aFDmL21PvTTKF0VBb879PDVJ6Qax636CxtSN+ohKPA2+jxc9
         fe8xUVGAA3uTjY1jlcsiw7h7fUMr6TziVTg4wpdq/FGHINOrk8xK8vHCp0JKU1rCCr63
         hkatIhYtie8WQt5WO4JSQgNYZJI0rv4wt91GHK8Y/9zkicGGg3Pb2qmnFwIbGf1NDypD
         R6iCdW8tVnOarELb9nZanchI8y7VvJf8jOH4zGMbnWlz1gQIwKR+j/VMB6dpdAFwY4M8
         oAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742367885; x=1742972685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jiAfj4IElgBqEg5+PLChSU4IpIj1nxRfVkLGRm2D6Bk=;
        b=qpmYFgfb9J+HDCbgisbRRahhM3XU5lmCgq1ER58RH3a4ye03Xs72VjM0Jcfg/guNaT
         CTilbh3FNszhn+DjUj+g49/ZtW/6vgipJ24yNcJ25OGzS0XqHt0h707JMcX5RPq1SzWX
         cLsDAjilX34C6LnEMKLLo/Ym0U/+dUWLVC+qPAolJhg5CoPX+C6220ObC2h5XgLliAYs
         SvcedlrYVk3oIZ7gjug3sXx2S8PcQjewdQxzsvCPdRvAVnc7hSR0x8z1+H6z4yrejDBq
         Ndn6MJjqSmBra0p3vfxa+5g2F64Hs9VvZ2Dh4gY+aMeRCXxvgAxcCmCTJPR5dTlZtnvv
         6myQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN8oglR91ENg3JAW3D+B4jPAyCk2z33XCFCrStfjkTz2zHv8y/GG7wTLZT02OMA40qokw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwkF83PgpFgL6/dv6md81aqrfMkAjnm79o/Mp1d9UDwUdh1Jmn
	QZaNVIKwVRb1O/d1LwukMC+YoS/S6OWQlYB26ewXZkqW39Mribcupq1xBXdxDJIXDQpvzyygk3c
	mXn7OJQsVNmPTzWyNO6LxjYbjlvqARXGfQOPQKQ==
X-Gm-Gg: ASbGnctZi2bMcbYQxsssk5vHe3jGicmVzfFqZvGmwrEayWbO3/evK8UDETqMBmoBuwH
	0gYjTT8Y64x5kNmgjgfL+udJyKiJMEXbSW0CQuEryGtdVOYHUC6LtwfAgZEdi+KSYtzaUJTC8JX
	xtB++SDTFYH86ZWfEEAu0t0T8=
X-Google-Smtp-Source: AGHT+IF7sF+rEHN+McOd/gdhxtrQC1m+FhYZvpf4dWKwkOdb9hKSjw3U2gTtL2CCTwVJ/KBH2mS5pciMbrLsv3G0xEU=
X-Received: by 2002:a17:90b:4c4e:b0:2ee:d193:f3d5 with SMTP id
 98e67ed59e1d1-301bde41b97mr2645278a91.7.1742367884632; Wed, 19 Mar 2025
 00:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250318085444.3459380-1-florin.leotescu@oss.nxp.com>
 <20250318085444.3459380-2-florin.leotescu@oss.nxp.com> <7afcd224-1154-4e2f-b383-10f6a89fdae0@roeck-us.net>
 <CAEnQRZBmYdLh29ha1FKz8=CbxjFBFFTgDkjrEmwTxW2WcxodfA@mail.gmail.com> <ca734f66-593f-4e7c-bc76-e343a7eb88d7@roeck-us.net>
In-Reply-To: <ca734f66-593f-4e7c-bc76-e343a7eb88d7@roeck-us.net>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 19 Mar 2025 09:06:17 +0200
X-Gm-Features: AQ5f1JqTh1OKvsFHXWbBK7NlMP4RU0DewPez1R29Ybz774cJu_EpcSsA7szRxbU
Message-ID: <CAEnQRZDf_ko2p50EwR6q=dfkwdqE=c7fZe0jO2JdSmbaDa=j3Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: hwmon: Add Microchip emc2305 support
To: Guenter Roeck <linux@roeck-us.net>
Cc: florin.leotescu@oss.nxp.com, Jean Delvare <jdelvare@suse.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	viorel.suman@nxp.com, carlos.song@nxp.com, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, festevam@gmail.com, 
	Florin Leotescu <florin.leotescu@nxp.com>, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

> >> Is it necessary to make 'pwms' mandatory ? The current code works
> >> just fine with defaults.
> >
> > The code adding OF support is added just in the next patch, so the
> > current code isn't event
> > probed when trying to use dts.
> >
> > Or am I missing something?
> >
>
> The patch introducing devicetree support to the driver doesn't evaluate
> the pwm property. That makes it quite obvious that, from driver perspective,
> it isn't needed. I don't immediately see why it would add value to _force_
> users to provide pwm frequency, polarity, and the output configuration
> if the defaults work just fine.
>


Got your point now! Thanks.
