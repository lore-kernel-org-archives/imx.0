Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F8935979
	for <imx@lists.linux.dev>; Sun, 19 Jul 2026 22:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784498535; cv=none; b=lryiwlBe+I9FTQZmd1WgwM03enA8AmH6ER+Yg9K/QF5fjc8Oi64+2tuCKiEPOm/pyE1eU8mT3gdBRvVDIzHWhT0+wLiTn043IFaslhATUuQyAtQHeR7metE8zcqBFUqBdmarToJnC+NghOsFjSeqWDgMnVdRbHMNk2V0CHI3tFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784498535; c=relaxed/simple;
	bh=67kSqJxBYeYORHm3dPY68gMhUJtatG/gvs2HaazGZ88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdK7f/7Wua8Y8Dcl2NCx1pDz77w5OUaF9w0MjBypXQ5NRZS28HaaVvtbBeNWXDFbQR3EUw4Gyl2mhDLRnRu/ihB+3rZPtbliNVwLMKrO2mpaFM9earmOedpM4UftTARLSi61jBLwPEx1/tntLfKB0mzDhHEjNVKLUghLEuTTkbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/mChse9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/mChse9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso11372895e9.3
        for <imx@lists.linux.dev>; Sun, 19 Jul 2026 15:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784498532; x=1785103332; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CtzMPjTew5PFKy9cuAsUj9YRpPA5Fe9E0O8jZqCNoi0=;
        b=E/mChse9yRP9FAWMFSb6vzZwxAHKsYSKUuMOjj5NkVuayVSGLA9ETAfsCk06Moyavs
         fC/HSL+XL/XHcKakgYCdLXg6HmWeJxfSUsfDylqQ1vIKEXKUAv7EqqczXuNGC8SS6W/k
         x3sg3unHDayDuraJvwGjgz5Iu0pguqvTwFiCr/V+uIHj4O2lcYpyVyUAJ6pRdkYNJNK5
         1KYhXpoOPXOvM1mYYMjJJN+77u5Q9FrH2FYqOp5MyGtFZapWrRQdEoZqtv/nHrjygVXq
         xVOAtbRB3gbwtoadwyoVzncVwEWq69IViYgb0ke/gWongnaXATeNUMbfGu2Ts2RXPgy4
         OQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784498532; x=1785103332;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtzMPjTew5PFKy9cuAsUj9YRpPA5Fe9E0O8jZqCNoi0=;
        b=YIo1wv+ddtPPgT51nh34Gy4CKl+ktXEpX9gs4DRqUgeE4xaTqRu/7YnWGZ1yoU4rwG
         cNVIKOEBKhIrotEIPU5sHlUxW5h82R5ObTaUIj7CCpTBNLx8i9r3EiIty7PwfSgLZTBZ
         yeiwFH9SmmKkaon1OssvYrqPso4+0XMvKM62IfAHDJy4C95TbUTirQdB57wz7b4fIPK3
         OrBwgkfhjQljszrHfT0CA3TIlt6nFeEV4gJx9MmT3DCTdIuINHlCHsQ5uaCI8fKWIHXA
         040GXRmjf6qaKhws4BO7sG+wK62tP2ew8VzWBrVzDwXZieb7q5CHZowFKGhcEYyoqCle
         VK3Q==
X-Gm-Message-State: AOJu0YzF1Srli15UqZWnW2mDSWrIziU0y+7yYXD17JKmtPfK63gzHOAf
	naav5ZXeGkDk8lpbvBU25oyHsDha6vnCmoo+XVFnKyG/F1cnEJsaxMC/
X-Gm-Gg: AfdE7cmOjBO4cp+2ZtfGCc628WtfZR18jVGN5KlmDqpS35ExgHCH+a4ZP3qyd/aK19E
	V6iLHYRvC3+ITK9boDzHlzdV+FbQJ76KimGSfAi4tgt1rKUeNQ5kGVNhN0Als2ut8vwA7KQ4QMx
	sXX/qfss2WnamrteHWEUho4PyYVgctQbSXYfJYr1d/Ao3IBTa8CoLSQ6EqhJ84Qy9DUFFJKE65+
	9Ru/akYKd5UmoevuzqBr7A0GCvlRD+89nhUwQMj31WEUFIOKT8zfvSWtJ43mYvEzjk3pygs8o07
	YoVKeDbHsKGibWNIpDax9HQU6zk9VR5WqBBg/uVGTu7q4sAR0zxcq5QjSsaS+R+JOZ3Hy9v99KA
	AZeUAl2KSpLOIrvCNUQU1KOLpBJC7Wk5m4acL5UeP3ZOQQL+CGlyTJJTpbBILuFKMh53A1XrbQN
	+uDujFjBZuI1HjjMuGlnSeMsoGrCEtG2H2ShwXSeE6I1BEisff14hJYjnj0e32ouIDgYGI+1OS9
	h4fTrArZrx0AVM1FS4plnoEVm4xRzKbN2wFqfyX+xBeb9bcvNloht4TyNI9cGS2b4JsmDDTQHWN
	1LhNFOAt
X-Received: by 2002:a05:600c:6a0b:b0:493:c453:6002 with SMTP id 5b1f17b1804b1-4954a516453mr75828265e9.35.1784498531930;
        Sun, 19 Jul 2026 15:02:11 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-aeaf-bd01-78a0-2a2d-507f-c97c.310.pool.telefonica.de. [2a02:3100:aeaf:bd01:78a0:2a2d:507f:c97c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm151510615e9.0.2026.07.19.15.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 15:02:11 -0700 (PDT)
Date: Mon, 20 Jul 2026 00:02:09 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH 4/4] serial: imx: clear imx_uart_ports[] entry on probe
 failure and removal
Message-ID: <al1CmLgNC4Tf5amR@gmail.com>
References: <20260719160812.35407-1-kmehltretter@gmail.com>
 <20260719160812.35407-5-kmehltretter@gmail.com>
 <20260719162850.043B41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719162850.043B41F000E9@smtp.kernel.org>

On Sun, Jul 19, 2026 at 04:28:49PM +0100, sashiko-bot@kernel.org wrote:
> >  	uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
> > +	imx_uart_ports[line] = NULL;
> 
> [Severity: High]
> Does clearing imx_uart_ports[] after uart_remove_one_port() create a race
> condition with concurrent sibling probes?
> 

Yes, this is valid, but the underlying issue is not new.

Before this change, a dangling pointer remained in the table and could
be used by a later sibling probe.

This change narrows it to a window where a NULL-pointer dereference is
possible.

I'll send a v2 with a driver-wide mutex around the table updates and
port add/remove.

Thanks,
Karl
