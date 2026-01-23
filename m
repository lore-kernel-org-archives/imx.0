Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707FD1B394F
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769173990; cv=none; b=X9ojIaZ4cHxsDw63AD22FWPEe4HGg2SP3vRJr6kiwrnhcmKUpeXslPRWCytLcqJq1+VMFQCp/zBZaKVoB/oadwIqJiU1mCuC5t/Yp8iCfE13JE6m917v7SZs3FlggWfHENVHhu5v5p7SId0P6OHZAmLFu0ELTw8Bpgtodx3Wb60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769173990; c=relaxed/simple;
	bh=Y9CZ9eMlhp/kFD10KukTiQf1yHbH1ObA37arceDpi5w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a3na2ijOC0OzB7fqK1ibw/YI58GJDw+sHVBgh4TbDw32Rg1TCF0spxTbucimVbJeFejM1KxR1ME7b27L3oW9T4DqSWQBLimPduoaOOMS2/dhBG2fwBJMUWua1Px7HIhsSW9M4du0keF/1XCjdsR2yAB7aubn6x1gdzU4IsafUEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=hUtloW+W; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="hUtloW+W"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5595A10D866;
	Fri, 23 Jan 2026 14:12:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769173980;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zm5lrGHaaf9sNfErhKfvyH2cd0YHIcDO1gth+1spoB8=;
	b=hUtloW+WnY7BFkUDr92urRQbAcA7J4PpX5I9S4Eoma7Ay03UJloEK0eMhdL1lDPcaJNfr7
	F8meKfTSGHPtqe+RwEi8uV5TenWQEl3QJPZTDP4VX1pe/2o1ikjqXj0RsT3GA5MY/aSJqL
	HDRhOBLq2lqx4SUw7WU5dVdEzwWbhFYQEAwoKQeIws6qyJVR/avVzSvj7VvcCfum/SGAtX
	ePXjmzukNk/CMSo0souoGEgm7DjQpe5JAsMM5URo5/pDNs4MP1s6ovqYxxA/mvYMHFisJL
	e6L/t9yp7n3VzN2Q2wPLNY5hWQZwHLSJ2M6P3EHXzsYQBeBQKpUPLL/UZPyy0Q==
Date: Fri, 23 Jan 2026 14:12:52 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Michael Turquette <mturquette@baylibre.com>, Abel Vesa
 <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH] clk: vf610: Add support for the Ethernet switch clocks
Message-ID: <20260123141252.3250c6ce@wsk>
In-Reply-To: <20260122200514.3cdb6fb6@wsk>
References: <20260122130649.4150338-1-lukma@nabladev.com>
	<4a593537-e848-4ed2-b6c9-fd2e6b165f73@lunn.ch>
	<20260122200514.3cdb6fb6@wsk>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Andrew,

> Hi Andrew,
> 
> > On Thu, Jan 22, 2026 at 02:06:49PM +0100, Lukasz Majewski wrote:  
> > > The vf610 device has built in the MoreThanIP L2 switch. For proper
> > > operation it is required to enable ESW and MAC table lookup
> > > clocks.
> > > 
> > > The MAC table spans from 0x400E_C000 for 0x4000 and it is
> > > necessary to provide clocks for each AIPS1-"slot", which size is
> > > 0x1000 (hence four separate entries).
> > > 
> > > Those can be enabled via clock gating CCM_CCGR10 register
> > > (0x4006_B068).    
> > 
> > Sorry, i lost track of the state of the switch driver.  
> 
> New year, new MTIP L2 switch patches in preparation :-)
> 

Just to share:
https://github.com/lmajewski/linux-imx28-l2switch/commits/vf610-linux-6.6.y-mtipl2sw

The driver has been tested (after backporting) on v6.6 LTS with
PREEMPT_RT.

Moreover, I've added support for switchdev.

> > Is there also a
> > patch to add consumers of these clocks?  
> 
> In short - this patch set is a preparatory one for vf610 SoC support
> of the MTIP L2 switch.
> 
> Those changes describe more thoroughly the clock subsystem of this
> SoC.
> 
> >   
> > > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>    
> > 
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > 
> >     Andrew  
> 



-- 
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic
