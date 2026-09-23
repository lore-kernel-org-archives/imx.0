Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4293B389E
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 21:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197393; cv=none; b=Dml1PellfK1Xw3SQU4+CBPiQd8SJE1jrNOSLDR0mcbnwUJ6+QRjpdBcBtxp5MZRr/R83TxIf4rwEkeeKqqQxyU6MXXfrjz7Zw9YrKOW36+bgTtDhMGgmhMJQM/Nt6AaFIJ/IhntkFNjaRtKVpi+pBD5MO8RZslWEOE9uc1AUle0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197393; c=relaxed/simple;
	bh=V8xcOFGWQPMTSprDRa3yYxi8wSmB7wiOFbJrnC+xVpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsJdSNuxPfilWtgh5mtrI5BmSgJ6Yl9QI4znUHY6+NZK4n6E4Cq7z+Jk5CSK3G2ZalX6dAVqK/LOgWEZpwjSmSngDR8+G49GBZ2iRc6F5NdiKDg698SPY/08h2+8Zk1LgN3QQ0HAZWRG8bW6d+m3YNhVvSr4zIeeg6dWm+BhhjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvYwBmXO; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvYwBmXO"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so844231a91.0
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 14:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790197386; x=1790802186; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=urjJV9cwlFxNv7KbCDA3FefKThqBp2XiJBexrbouUOU=;
        b=kvYwBmXOt/5R9UQEDAhjSR2T/0fOOICBlmiaYrP8DDZFre4usHEqvFrFhz8JAkYCtU
         GoMoUF9naxOEjjToYGwxHHCiDs1jD3mftT+CDaSr07x2FW+A3S9jDuM6equ+mC4YBSp7
         qInjng8AfH1mFinULZGIAoL2fYok7aR0XKEWHJtUGHHcm44HJ8m0+tuG5/TqB6Aet2mE
         ZNgiIgVSrVIn+KiUkExyzaNyLG3AfskJu7edUt4OsvDXjoWVNJCBDk2yqaHiLMkAchI2
         UCRKCRX8L5FFcw46t8mFIoPEwwwIqoBetdfebb7L8NBS9MwwRtl4ZSEI4Eis8n1pAxX8
         Mmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197386; x=1790802186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urjJV9cwlFxNv7KbCDA3FefKThqBp2XiJBexrbouUOU=;
        b=PsD2a6PeqROoVIj72/UQzlL9+3SfDJny1mjtAX/0ifuLe1KnE0u54UiAYtbAlkUzeP
         cfzxXa7tVviSgwh2hYitLcA/jX4XnG59cLiRRtpqsC5Y5xhN30sn75Vj68kW5fpmXr6s
         egx1pdtVW8gGVzHksAZUVCj2qJN9elqKqF96zPGusVcd6HDp/jYtL60g0RtAtRmUkUjb
         CeaMeEsZx2UdwSksZjCSsybKl14V/HsYtbZHV7c8wUQweZ60ic+52xPZPzZiE2FSlmdZ
         n6G8Jsl8siZRzl3/Npu+kY/YIUAIQeDW3L/h8ljBo4BkLEgdhwf4Ko0BNyMReirgCwDq
         xQNg==
X-Forwarded-Encrypted: i=1; AKwUvBwbgsMzagMR/p4NGjFVuw5Jp5iIImakcbZ4elNsQEiv3dUEX3ODXO4DsZqi8H2Gp+c42MI=@lists.linux.dev
X-Gm-Message-State: AFuF++kuiRHL4iQBYu+z1j58E6beUotsVT85bhPg8jNZhyykD6+F/vOG
	uxJ/V6PsyHUl1lZDyhoHJgogBhrte/Dms9WuREqvd7TEkYrs8IcTB5Fr
X-Gm-Gg: AYBFou1LRPCkJ/vgM/aoqSCms6P43k6K/pz72dlRtUSv88Uft1BFSPk+gkYJ5mqyi4P
	2DPsEPAFMSAbbypbTvT/wmsf0W7z9aNCdRQAxpXOMgRcHAV9hnLHlvQDklVwxb4GHHujMmRA5j1
	mppyl3ty2VETnFrp7a8k3wPUEXEqCCl7+CiRk6fkxoGqnvDNF9sv++GhAnMmqNi7QJE9dNiUxaZ
	ryZzmN+gX941ak3OWlxpG4PLgayaMZ92G5vJUcpRYXx9EiEjRBdchnSE2bivxxCB7bi23IJrtTt
	NHCEJX+g2f0ET93gOPxWK/kHZfO9MujeuaZVIcTvpBu5ZOlH33Py0nNDRr+Pq5IwJ6FmjnF4hyF
	HcGUSXq4S8dNOf/tAVdIq3m1MrDcktcRXcng7sg02BsOWxOho2GeRbVUgByDd8sJhURfNEp5LNK
	+UEe6ZAO0mGyo3MfT8GlFq9ZVipMFOCvaQ90Av5P/Y2FvNMSXFv1utE28lzg0GowoHb7EFcLl+K
	DCmJGgOJSoi
X-Received: by 2002:a17:90b:4c82:b0:39e:6c68:1552 with SMTP id 98e67ed59e1d1-3a09896ee0fmr243012a91.26.1790197385901;
        Wed, 23 Sep 2026 14:03:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972b15f1sm848270a91.2.2026.09.23.14.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:03:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 23 Sep 2026 14:03:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, linux-watchdog@vger.kernel.org,
	upstream@lists.phytec.de, andrej.picej@norik.com
Subject: Re: [PATCH 3/4] watchdog: da9062: reset board on watchdog timeout
Message-ID: <10de1304-577b-494b-b8d6-3792ebd1bbf3@roeck-us.net>
References: <20260923111719.2032012-1-primoz.fiser@norik.com>
 <20260923111719.2032012-4-primoz.fiser@norik.com>
 <146c3502-3205-43ce-9d1c-c58b936d160e@roeck-us.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <146c3502-3205-43ce-9d1c-c58b936d160e@roeck-us.net>

On Wed, Sep 23, 2026 at 02:01:03PM -0700, Guenter Roeck wrote:
> On Wed, Sep 23, 2026 at 01:17:18PM +0200, Primoz Fiser wrote:
> > From: Andrej Picej <andrej.picej@norik.com>
> > 
> > Implement a method to change watchdog timeout configuration based on DT
> > binding ("dlg,wdt-sd"). There is a possibility to change the behaviour
> > of watchdog reset. Setting WATCHDOG_SD bit enables SHUTDOWN mode, and
> > clearing it enables POWERDOWN mode on watchdog timeout.
> > 
> > If no DT binding is specified the WATCHDOG_SD bit stays in default
> > configuration, not breaking behaviour of devices which might depend on
> > default fuse configuration.
> > 
> > Note: This patch requires that the config register CONFIG_I is
> > configured as writable in the da9061/2 multi function device.
> > 
> 
> Please reword to something like:
> 
> Implement a method to change watchdog timeout configuration based on the
> "dlg,wdt-sd" devicetree property. Setting the WATCHDOG_SD bit enables
> SHUTDOWN mode, and clearing it enables POWERDOWN mode on watchdog timeout.
> 
> If no devicetree property is specified, the WATCHDOG_SD bit stays in default
> configuration, not breaking behaviour of devices which might depend on
> default fuse configuration.
> 
> Specifically, "There is a possibility ..." should not be part of the
> description at all, and "Note:" should not be part of the description
> and be moved below "---".
> 
Also, the subject is wrong. The patch does not "reset board on watchdog
timeout", it implements support for "dlg,wdt-sd".

Guenter
