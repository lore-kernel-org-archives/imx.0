Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B344413780
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 08:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633479; cv=none; b=HPuCsinqWiK5XIrL4CavnTTSxnLBzFHkH3px8iVVzaOePtgNjwO8j0RCFuHxC5GY8EnCqXBtaTVFN3O7uH1Emr4IDlCMP4usPPC9EzOg7CY1jcuXX3i5UqwH/anmnnAcBsIOGHyFSFDZ8zXxNchfEmU2e37/PWdJ+9vXgJIZaMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633479; c=relaxed/simple;
	bh=L9v9q98gPrJzJTT1P+rysIIc1Lf8YnVgiDYtobB54jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L0YLZYxFIChqf9dIVjcQ+PyFItA1OarjkPVUYrlBImpx2BnIr9tiL3v99ffi1zRG8wyn2DYxDEvd2z6W5kNDsMj0xURwOu9/rjIs0ZdGnkelWMwe+OoH/83WXPeoxc8OV6YzTuAgbpO8vTXJ7jQCupvOla3gNAZpYymIH2PTTHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+X9Cu25; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+X9Cu25"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso5287795e9.1
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 01:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789633472; x=1790238272; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DFlrcxSZmPD5dZXM5GhCeqxfFV5r+Gw3spLtAai033g=;
        b=c+X9Cu25jBR3iV0XDqA26D3VtKIpgEUvj4ag3t9vpbyWmwaF30AawuvWnu1Caffo58
         5pYz+0fVPkaHMaUbsMMyJrUVxXHy56tWpzFMoDZ4m/VaI+r8dsh4lM+xqhuRtl9fWflT
         /A4sCXRqFWdFgHSmA4HLDT2zux1xfu82kr1cQQ1KExiDmBLwveQdpYcBJDhPrN9PXn22
         K2FMJRnHnibK0OcCwhvLgqfSazAL3Ka8bRLhHvgydvCA36o99NighOIFEc623sI9n/cE
         w4SSZ0Gq4puVrThOnOQY/vDJfCKz/RStYa4Nyi4Zi5aj9Qw2zmbq1LcLIxWBXqkdOLnL
         hkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633472; x=1790238272;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFlrcxSZmPD5dZXM5GhCeqxfFV5r+Gw3spLtAai033g=;
        b=1ztIxm55nrgHJlIhzsmGabVKWHo95S9ekRWlHkXUIo2sEb0IBBlgLe4oWs6mTx8VXn
         V6NYfc/Y4c5I+GWQPmE6jKuC5uPvfM7JsdkbIVZNmhCUYY7iFmc7/YwMYVO+/OQrhov8
         5vNaUpvWrmO5bSLmxLLL23B3cgaKPr61vXCFWTbLRuMgWwXGFdsry7HEWiS2XfUwaBUu
         o+uNoOsgOZGhoSqVbbls+1wETkglsidLVhCH+gb5Fy6nJVNnFLMInkOoCPzLlVfx5gC1
         aDWukQejfI4iMFbIS7u8XMi0MqdmFGFiFho3cnX4G1cuHGNDvBj7uqMbotnCDzl7H2B3
         pGeA==
X-Forwarded-Encrypted: i=1; AKwUvBzj4NvPFGfeKPNM2+jkGFZKTF7+G3A1oflc3oXSbbjwl33yBMIA/XTZMK4Dkil1JAJGGqY=@lists.linux.dev
X-Gm-Message-State: AFuF++kUQZ+EU+r089HbVvfeMmV2Nzxl36PEKqX0/FROOOhyQ3HIpUYZ
	gvXpdhwWQ4OHs6oy8pqHVyiirpKEzYgO6fU74Ew7biorWKINwrdW5as5
X-Gm-Gg: AYBFou2CsXNN/dAV+aITB2+c0yexQsJeHlDIt2nGZeTKxq1qL7NNteKPZs8B35GENag
	9zBh0aX4qyaLO9tn6Y1QcK9vUuDWwjd2qnQDWgmAbWK1UJ1sBeWRGaTCJnvAjjqmoKp4nmsjG9k
	MRH52QaPDdKlwk2R5pis2Bw4jfHOIzV+8ZIm3MPD77KVc//Esm+J6l89zM7lNfiWwxR7r7zXWxX
	dRTZHP1djSb9HKDWjUyWwKIfnZwSgIOxKL0r/r5Z0M8s6ZzHfmfujYIWHZuneD426zv8Je13/0b
	2o6QVXMDGrD5noSTsUfKyh9F3pnsppKXLEndfouHC1xJLVSqr8Ui0iHP0q+AR0Dw1Vpy9SZyubU
	4BV3cOszG9vE6uLnrMDIAFYKOK4dqaZgaWGTlE71lqtDIYhoiwZmRGG9uzoqdoYXPNWysLo479n
	kL1nhdKGJktOAYB2GdpsM30z5k15JQLNQQs3Ga//+zxyu1KEE31UuKpAnKHMsNcahnsDP8sDUp1
	db+E8gVBvToliwr+MVz0qXcaollb972tnll6mSujnSz5l6GglD6FzFHuSoQbRHWACz7diQCuZMJ
	KIdPvmVNDpZLw5i073/sbeu9cFvaKV6jbsBhxjuiOfnDVEg+IkPucs2vG+pDvraSddzTLoi4enG
	xwqHwQOWwjxF694Cq2LUHCObkYMAngpP64zm134ZcRpSGQKwT9ay7FA3PcCh7nhEYNG5jW9HiEz
	r30QG5EWq3eVBmpjc=
X-Received: by 2002:a05:600c:35d0:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49eb7320b76mr75942795e9.20.1789633471744;
        Thu, 17 Sep 2026 01:24:31 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbefe1791sm38435265e9.1.2026.09.17.01.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:24:31 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:24:29 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng
 Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Frank
 Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: imx: add missing
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <20260917102429.00002faf@gmail.com>
In-Reply-To: <aqq_ymTi1I951uQp@SMW015318>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
	<aqpgUPWUGZp5Cjzt@hovoldconsulting.com>
	<aqq_ymTi1I951uQp@SMW015318>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 11:11:54 -0500
Frank Li <Frank.li@oss.nxp.com> wrote:

> On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:
> > On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:  
> > > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > > on teardown or error, causing potential resource leaks. This series adds
> > > the missing calls.  
> >
> > No, as I've explained repeatedly elsewhere, it does not cause any
> > resource leaks. [1][2]
> >
> > The autosuspend setting leaks if you will, but that only matters in the
> > theoretical corner case of someone rebinding a different driver (which
> > will soon also taint the kernel).
> >
> > So don't exaggerate the impact, this is essentially just a cleanup,
> > which is fine in itself.  
> 
> Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
> include these pair functions.
> 
> I get many similar patches since scan tools is more powerful now.

I suppose that could work. One would still have to scrub the kernel of legacy
use/dont_use_autosuspend() calls though, so it could end up being a large
patchset.

-- 
Kind regards,
Joshua Crofts
