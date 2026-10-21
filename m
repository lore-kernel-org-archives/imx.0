Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591913;
	b=g551MvK0pt/lOTdM3ZWZD19s0dH2I3+baLOUol8yHM7NkGzM64Asrzlnj/d5qg2dvEp2
	 6LJPHDW2B96Sjj1a1j5SqDh5Ej5sERbhkt6iRhAz12tUdjVTTDG0+IHPDbTyHI7PwdP12
	 CE8+tZF0aesJNwWfw/p/7g7K/T1/RJoW/jIlPEvY253Bi3MbOQgJLlR87+EU7OjTpkmht
	 gNJD1aTD9rv4lK3SQ8Fhfz4lRonIVasQqcr0IiOZ6SHAVekLPnjaYbt2lsQWsNxkxtNRC
	 qiGyRaW9sdOhqjUKMxK0cx8UyaUOdXDiPp6KmEdpGz0l1033yvO3e5U1kQ7F7XLxwiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591913;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:User-Agent:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Disposition;
	bh=DQoRVtL1rIECgPFKDyXfClZIANIPEM74LIvbEMBMv+s=;
	b=mdwds6hwF/xFSA08cBMyv9yxmJqZRJ4/rgch+EuQVOlc3nsTUUCMzlc6zG7IfRYHCnjT
	 98hNGHrkXUl7tM64JVFmU/iRSiA3/iWaQEk2OpD7MO5cM29dLW+hM8R9DuXm4qvbfiWiG
	 gyuLVlrHxtyE3iEsRv6m/MKfqkPt/SpLbyplDpepNSpVtK0unUD0EwcRl81gfkRQQ6jAY
	 RFBwD+Wj3toYHHWOnDW72Xw3CfboGlS9k0SOvSiuJtL1bq81LJooPsxI/yaa4hkIJRQNM
	 7wFqIYejiFcJNbYwJ4bNQmnZVtmU2dfr4o1ahH2tvEI3PVycUhEmQxGuhoezUzGfbDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jROkau2w;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479AC606A31A
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 14:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 479AC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jROkau2w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792591910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DQoRVtL1rIECgPFKDyXfClZIANIPEM74LIvbEMBMv+s=;
	b=jROkau2w7VvHD7b7uo6ic0liHEGY8OHL6KUbos8XfnoCoa4UstoOecDsP8z7MghE48v9Tr
	tRDNw1qO0otxxhCMVjXCQeOeVyfemAy0XZpBDMEdaPi2a5a906D+QEAQVb//2C1bpb+YCS
	Bmk5xzBBlPNfCe2HssdGssfK37L7nec=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-udlaBiisO7SVpp73V_AS6w-1; Wed, 21 Oct 2026 14:11:49 +0000
X-MC-Unique: udlaBiisO7SVpp73V_AS6w-1
X-Mimecast-MFC-AGG-ID: udlaBiisO7SVpp73V_AS6w_1792591909
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-532f343a55bso14398781cf.3
        for <imx@lists.linux.dev>; Wed, 21 Oct 2026 07:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591909; x=1793196709;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQoRVtL1rIECgPFKDyXfClZIANIPEM74LIvbEMBMv+s=;
        b=AKtMeUpQoOOpVskTqlA9RJbcLo80/DXpV7+Jd/Nh4CLX/TWTM7Iahnnpd4eMlUH3Df
         rmrGOjTQuGhFiCnuf8dVkKcAlh48kWyJNwe3flDHazj9qpz+WDj6LTnPhUvbaUhDhAF+
         KQxFPJ6gP9j/+MRrxb/i6t9lqKuWg1xYUSODq1+k4Jn6VUcJUR8zKoIru6BOoj6a5vSN
         M1y9FUA35oFdlcMr2nDicw4YUgOThs9Ki41jilGG2p7+AQF5vKBziWPmTREgxBAiyowT
         xPU21LzCUeSgVPDabA7YKGpKqoyMwgoi8a/Ge6NjZYAR0VnmPS6m+PGclcpNxU+Dnuee
         lbZw==
X-Forwarded-Encrypted: i=1; AKwUvBwqKQLYO9kauSKTGOfWeZSDBBVm1T4AYC7ysxwPBux/ECiQ9B6tFt6Y9ld8vCEtcRk9be0=@lists.linux.dev
X-Gm-Message-State: AFq9FYLOudV6UQ2FHfMYlioJ+iv7UTIC79VmvWwt3w7khjWdL17TfBcb
	qjqWFy2pLbRR926VLsBgS2yQxyYSARx90pcOAO9VLyyApa4VcXpC3SZmdiAXeciswsJCO4YcfYH
	B6DA3vrxwyaWVQ0f9VXFE+ac/KL+QrPU0FsGxSLbUIRVZimbbNaBl6w==
X-Gm-Gg: AYBFou0/W2FNDve1cAqscN1K+Ix9TWG+1RIXWIwopMiFuHWfgsxZ6CA3oaGpN9qgOwf
	ikl2q7Z0udjqtK7+IChzOI9N0lHDntRYPT6v9pLhJUcLAeSw1P9ZLXVe08HnKZ2cSFNc+vYlADU
	Gbz/KTG3u2DiQL9kh63PmM8rkbW1tfU8gcFzq0zBEZI5nYLAlezBtXBLTtsE3Ez8Oc4kx0jmGCj
	HCsQRkO+I/w9FxT92rcBubZTO/Tx5fjX9TEQ+ZrGxUN7xB8nI4SNTY014SMsxqLYXYaZIeGxsk3
	eEIPBpDf3T4yllr0mnI71oP58Nf0uvKOO38UMkX9vgiIg606H0BW8JW+UfHEu1TRTJqj9kJpFGT
	4qylely5jiWISXiJbiu9kAME+KI5tGPkDvjzcn2yNVEQDwEEDs52Dukx7H3uhzHqxOxU=
X-Received: by 2002:a05:622a:888b:b0:536:8ac7:3936 with SMTP id d75a77b69052e-5369b8e6a57mr31497001cf.61.1792591908993;
        Wed, 21 Oct 2026 07:11:48 -0700 (PDT)
X-Received: by 2002:a05:622a:888b:b0:536:8ac7:3936 with SMTP id d75a77b69052e-5369b8e6a57mr31496191cf.61.1792591908163;
        Wed, 21 Oct 2026 07:11:48 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10f38a6asm24903486d6.29.2026.10.21.07.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:11:47 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:11:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: Use v2 rate calculation on i.MX8MP
Message-ID: <atjIIHkoNwBVDO5b@redhat.com>
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J2bRPO0-QIY2CtmKZXxzDjBbAb8NVT25LvjvlU7Pvuw_1792591909
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Miquel (and Jerome),

On Wed, Oct 21, 2026 at 03:09:56PM +0200, Miquel Raynal wrote:
> Hello,
> 
> Thanks to Brian's series, we can finally solve the problem of rate
> calculation faced with the i.MX8MP LDB/PIX clocks. I've tested this
> series using a v7.1 mainline kernel with a lot of unrelated DRM
> patches. I then re-applied it on top of clk-next after fixing the few
> conflicts when applying Brian's series, but that means I cannot (yet)
> run a 7.2/7.3 kernel on the platform (and applying this series with b4
> will fail due to Brian's series no longer applying on top of clk-next).
> 
> The DTS patch is there for reference, I don't mind if it's not picked
> up.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for testing and posting this!

I know that Jerome would like to see some changes to my rate change
series before it can be merged. I'm going to probably poorly describe
his concerns here, so apologies in advance if I miscommunicate this
Jerome. I'd appreciate it if you could clarify.

- Currently the latest version posted (v8) to the list has the LCM
  helper (clk_hw_get_children_lcm) in drivers/clk/clk.c, and the LCM
  helper should be in clk-divider.c. I agree that it should be in the
  divider code, but we'd have to export some additional APIs to allow
  that. In the future if we went with what's in v8, and wanted to fix
  the fractional dividers, then it would need a similar type of helper
  in clk.c, which is not ideal. I initially went with this approach to
  limit the APIs that are exported from the clk core.

- I have a draft v9 series that I haven't posted yet that adds two new
  helpers: clk_hw_get_num_children() and clk_hw_get_child_by_index()
  similar to the existing functions for the parents. This allows moving
  the LCM logic into clk-divider.c where it belongs, however the
  downside to this approach is that it expands the clk exported APIs so
  that providers will be able to fully walk the clk tree. The concern is
  that providers may abuse this in the future and it may limit future
  changes / cleanups to the clk core. For example, if we wanted to clean
  up the way locking is done, this may potentially limit the available
  options.
  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=clk-divider-scaling-v9

- He would like to see it where each clk consumer sets the min/max rate
  that's acceptable, and the clk scaling in the provider takes those
  ranges into account when rates are negotiated.

Anyways, please chime in Jerome if I got this right / wrong, and any
additional concerns.

Brian

