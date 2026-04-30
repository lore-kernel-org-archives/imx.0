Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B613BC66F
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 23:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591065; cv=none; b=Q84C19LMYSZRRsunxThwDF0Q3IuU74iGEjsdTcX6noj17YLwBCVK6Yr3/ha5zounf7PX1oRA2PI3bpJ4Wks6Z5yzWJykyVph4COKf2Gc+r3ZqCqv8EoKodtQuMu6qs3y1JZNvT+WXD/NlC12gAarq/Lfys16HsQ9jsqp3vii0gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591065; c=relaxed/simple;
	bh=uIyWVp8D7mfhSE21zLSXRVsmni4doJzep5hg6+i9+0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjsAoCQDicwxZcVTmzW3CtoGTz0pc3Yv29vdJA8njBYA5KYTI3RslkioEgyK8NTPZ2cACZAGuxs66lf+STFMYzP7y5lxqUSjQ8BEW1VLNSzOQIAdmAdIdFAkQxinhiTH2Lr8iADyflel6UYUsDMS33wEymXqEy9T0iv+9X9Bxpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gm72fU04; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gm72fU04"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b24fede2acso8933785ad.3
        for <imx@lists.linux.dev>; Thu, 30 Apr 2026 16:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777591064; x=1778195864; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPb32HxMm/+qEq7JGxjS6idVv7iM9pOULTkDilujde0=;
        b=Gm72fU04oYGNAtMnEAV1MV/zrfVJ+RSbsoRMWa5jLLMcPq/hu7zcAYKPfHuIBK2jUE
         FUJV5My/J7wMeNwIhdlf8qh6E3eW1P9brmMNwE/kZA8QYsLnoD+8ez2tPJOWqk8wW9BU
         AUKDEPZbes7ZKL3lxeGUhXMHbu8JO0coMZlPVTxtQzu93xJt64L9Se62akoiP1RkO0Vu
         mVkra1cc8g6htfPPjEqNqykCyK46f2969c4KNqagEDWNInp3PVDKVx7u+nZyaYMk44G8
         9rNmH1Is52ef1MbZhcI1y0Mbc0C2kgNp/aBGBWxvG6ttvB/ruLw2b2W7l04XnpG7JVia
         KBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777591064; x=1778195864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wPb32HxMm/+qEq7JGxjS6idVv7iM9pOULTkDilujde0=;
        b=J+21y0RpyuWp6YDJvFl1dmust0u0ec7MAe+sfFvtVGvHYJL65n4MpsNk0Q4BUwnbTH
         MtbzHeHb93HCm77e6QHajfGr5c2ygT2s71fXPOlFuekL+Ih+RIBaYbgWgdSlKrjyuY6U
         bgcsm0Vlw/EhmzjTke4OPe1l21qT/WvXFkVk3GB/mjVOMymhzhEKYxAw9Wjxj7e/Mgxn
         lsD0gMHA7qBZ/DY6n2LnbZcLQFX5X9ej5YPbfVYxxQK0ZSxiDbNGZvUndBfzTSbY3ZZg
         VdtccXb//kVQ3Gxt8CZ4MLDzPQMYL7/VMmbKv5ki9xxBUh52u/k/bmJqlP/8u/S3B9XF
         jqNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9trfK6E9mK2HOXeP46FKR2L+uOcLnpQEa+TT5mdVtdHiIXcX/7BAYfNYUDlAz8k8dNOHQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuvCbXYW/rs9K83SuehNTyJYrVzsNyDXlHOOLNlh8Wtmtiva7I
	BjKJ/U00ssnjdgLvfna6c0sJCaWwskOeo7z0caNa8JnU7CtkutAYDoJZ
X-Gm-Gg: AeBDievfYww4XimjbZBtaFR+SDF6FKhfazaSVGFB5oBoZhawz136HJE4Yz1SS4IfWgz
	sS9dg1qGtnIygqlzpgiraVRmdteRtthGagtgGNn5XPEoXzZ36wlCBK9EKQ/1tHgtHFy/ilHuV7N
	ZJcjtASy9wtvK2f9mIpXwazeFyfbk+AO8bvwhjJXEKNekBtuXNNzflKo3PyyLctwueXdiFiJmEH
	RudaD4B2gC9pAFUbPNxYZlkFy9ua31eukf5IpiMXGAaMvxstFfbBrsrw+JIln41OdhCV/0zje5X
	iws9/7N8uO4/UUTVI+UF4vZrDRsC6L4i/c4qvNB1/zMSrgBR0j2bcAySVf+FVbQiI2ih7lEVdy5
	Sz+rSBlR84cLS8n1C/BwfNbMcE0KM8nc9EgzGFhUno++Si3oEV63dOBcoAFthnzqieNNeN1MKEw
	zu6NXaGHdVl4ripG4h29NY1WH9J/lv1RoOcTsqAwij7MxplKc=
X-Received: by 2002:a17:903:4509:b0:2b7:a350:463f with SMTP id d9443c01a7336-2b9a2316e61mr37002455ad.10.1777591063991;
        Thu, 30 Apr 2026 16:17:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae58906sm6249995ad.74.2026.04.30.16.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 16:17:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 16:17:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v7 3/3] hwmon: emc2305: Support configurable fan PWM at
 shutdown
Message-ID: <931b8c3c-8555-4333-a660-e1d78fd67a00@roeck-us.net>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
 <20260429065955.2113012-4-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429065955.2113012-4-florin.leotescu@oss.nxp.com>

On Wed, Apr 29, 2026 at 09:59:55AM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Some systems require fans to enter in a defined safe state during system
> shutdown or reboot handoff.
> 
> Add support for the optional Device Tree property "fan-shutdown-percent"
> to configure the shutdown PWM duty cycle per fan output.
> 
> If the property is present for a fan channel, the driver converts the
> configured percentage value to the corresponding PWM duty cycle and
> applies it during driver shutdown.
> 
> If the property is not present, the fan state remains unchanged.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

I don't know if Sashiko's concerns are real; if sysfs accesses are still
possible during shutdown, lots of drivers have problems. With that in mind,
applied.

Thanks,
Guenter
