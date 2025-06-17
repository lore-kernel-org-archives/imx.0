Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B862F5312
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 22:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750198991; cv=none; b=QDQMlOEgt3Co6thZh2Wcv1ckPtOSNdNhbx1uu6ucHsQ6ti427m5RVWtRCPaNgcHQMJRRlR58qJ0AftLBHpOEhHpJbh5g8e2nP235Ic2F/rn6pT/edj5FYS8KkAg3UCQs7iu5Xb789g9+qXG2ztQSqerLlJRn1REx0GFhrcPKHrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750198991; c=relaxed/simple;
	bh=kz2nXruoOT+8n1Te4FqDwPlaM62tv+vpn008cqwOM8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZQRIVh3frLu+B/nE0KvDl6eGx691fNxUb/kwmCzA1f0lhHpaqqNa/kDu2PsXPykv0GD1LEbrmnnynW+5UorL7VTHJI7d3surNg+ZpFEEKIKRPobj5nezh6KkN9SQtNUdn6DJNG3LrPkD0XLQFrNdmvEKbUoA2+vhk/ctE0zIdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZH0+nAcv; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZH0+nAcv"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742caef5896so5204623b3a.3
        for <imx@lists.linux.dev>; Tue, 17 Jun 2025 15:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750198989; x=1750803789; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ba9cyjWK9a5gtS/G1pUFwvKLF+g6GdyoidJ+9RnzRZo=;
        b=ZH0+nAcvpwdN9KuygdR0w1G8mU4f4FawWvq/ysPVcXzdFGlet/xkTTwqD4VAP7GLmV
         V8u3O6celvAGWJI1mEoijs6UAuXCquBL7lSlOzpirweYwWypfEdLPe28d8Cxr/MKaQRZ
         93eRF+e951PmRgtSfird0BjHRUQIGxATJmgBRM8iFT9Sk/cPUrc9AdzMzB9vNO0K1JK4
         kPH0VNST/PhDfQl4lF15+ZBzThs64kcdeIA2dAhPHKf4WGdwFNEtaHjhFlHx403sJGUS
         xzT1VEqbc/9LOicEkvKWpHA7vs9ODN6GVPRO6vM0/r03zwgIrCESTcS5S2+y4r9468Yk
         2OQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750198989; x=1750803789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ba9cyjWK9a5gtS/G1pUFwvKLF+g6GdyoidJ+9RnzRZo=;
        b=IMnOiGKT+p2n5w9eyAT9oDubdhX8MCbbkpUjLV61idLYICF4g5yah7PDh2J7LhXPz+
         WIQIFK726GUf9wdL2dN5UiNSqQlHQgz1Yzt30F46Hebti0k0qrcnGIScXNwQgc1mGlG0
         x1IgmheC/AD5/Cv4QdbT2/WVJCZluWDnqdUhyCB7KM2hZaTlW1Cbao3i4FEeeUu3CEPn
         mKf8qy+YgUDfuXNRwtfzc3FAy6zvFOUK2cNnUcFAeONQ+c2fM+gdv5HA8qHmdVGVXrMI
         XCtNjSVyfe3utAmn87SZJdatYAt5tH+3kJgWaZULR3a9f7qZ7EHe4XAgprAbH5kK39EP
         MYAg==
X-Forwarded-Encrypted: i=1; AJvYcCU/fYboBFNGJ/K1P9kiE+n5Zrr0I3J1Xbl52t2L3+pAs32aDSG/yUOobq17sJcEMc8TQxU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIGXifTC71dAXOJJV66blMt4qM30SwjDVDc8BFWi6avuwf5NYd
	zCKrKTBlXjbraGOLS+7snEUvasPyrPVLZdq7yEiWF+1JKn2CpZs8paRa
X-Gm-Gg: ASbGncuZRPlnLD7QqlhXHXnQ0Aaz6MVxB67XwqbX24d9mAGEWj6/bxYfe8JMYJ6K24h
	UwMu1DH2tYtHI3Ia2WOAG7DWpqIaNTpewaWcLOwGYKwwxg9QGajyTUcJP2nYiquNnBY/P1/MQN5
	Ma7S0Db60/0g6diIMmwonfD6bJTjOHGIkL6v2evVnKpnK3joeemVZHbBDigmFBvzaYE9Sfk52YF
	X2m/LmKMBSk4/PQx6oWgLeE2ZFXFT3UW0+3VpQwrisIVv79FGwZI0VLnrVp4zzzMF3B2dlJqsJD
	J92l77TXohhL5uEmY685gyrGato3o5NGlIcUYTqtDYZJvNU5mFdoUB8MiZ6AnCs=
X-Google-Smtp-Source: AGHT+IE6oCWcEIA9hAHCoer2+7IQhN18TAtn+EtjnVuvExVsZnZ1yzO0ig6GCb71zYvYy290rTKOoQ==
X-Received: by 2002:a05:6a00:1787:b0:748:1bac:aff9 with SMTP id d2e1a72fcca58-7489cfc7ed0mr20839980b3a.18.1750198988866;
        Tue, 17 Jun 2025 15:23:08 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4cd9:8b8e:24cd:5a36])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b0bfasm9434791b3a.122.2025.06.17.15.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 15:23:08 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:23:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: samuel.kayode@savoirfairelinux.com
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Frank Li <Frank.li@nxp.com>, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-pm@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, Abel Vesa <abelvesa@linux.com>, 
	Robin Gong <b38343@freescale.com>, Robin Gong <yibin.gong@nxp.com>, 
	Enric Balletbo i Serra <eballetbo@gmail.com>
Subject: Re: [PATCH v7 4/6] input: pf1550: add onkey support
Message-ID: <5eehb37ccuoafc6x2axbgesr3mweeepoco46ih2hs2ncekch4v@ku25pypnlads>
References: <20250612-pf1550-v7-0-0e393b0f45d7@savoirfairelinux.com>
 <20250612-pf1550-v7-4-0e393b0f45d7@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-pf1550-v7-4-0e393b0f45d7@savoirfairelinux.com>

On Thu, Jun 12, 2025 at 10:55:46AM -0400, Samuel Kayode via B4 Relay wrote:
> From: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
> 
> Add support for the onkey of the pf1550 PMIC.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Samuel Kayode <samuel.kayode@savoirfairelinux.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thank you for making the changes.

-- 
Dmitry
