Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E6530100E
	for <imx@lists.linux.dev>; Tue, 28 Apr 2026 20:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408709; cv=none; b=iyy3j7/g9Jz43D0E+/oK28qbIVXSBXxkUQExV0yruwmqPJOGNlL0mLN6Hk7aOaIZ6tJgPoRmrwhATud1hPx3xcCxTxQGUvEOxFsAEl/qcCectag7NWzbZQpY4F8ReoyJzXgiNizVT89tkVPbdDP9Wcm+RjnpxlJ5f2cdSnGA4zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408709; c=relaxed/simple;
	bh=pDmse3ikNE1vwAD5KYJ0YIqBXCY+TX8S31byHNChdqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FXBMQmhYZNwyJK4dyLy46Rd134I65meAQjqDg30KOMfk4H8S0ez9FTPGl4g5aAPJFc8sdumgOFxN2L4wSgZgfTLcbFFwiRMC7rIlvCo8+ArpxZGAbpo9vVKuQTb3dG/ybYK7hJ3HdTSgV8Ij1Uur4HqvpkQCX9v+kiPtFkIquKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IF+tWKPT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IF+tWKPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777408707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b6d3l70lYqSnvJpMpEGZJLw4o8TwsL0Q+e8A9O8Mofs=;
	b=IF+tWKPTp21nVd/IlYdml0wPUP/d+N7v5exjZAQrvjcdIsPY0fPasq4HdyBK9ImESoqdcJ
	90WUKJH7J5bFVqhaBGGTrQpPzcSww3dTpfD4Bc3ffGStXEotqTIb9Pm8+2lBY+OHpyKv0p
	mI+zQ9LKAOBGkSAnYUE8an6jcnWjhD0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-JJZkpa4TPqKJR0E4fSl_KA-1; Tue, 28 Apr 2026 16:38:26 -0400
X-MC-Unique: JJZkpa4TPqKJR0E4fSl_KA-1
X-Mimecast-MFC-AGG-ID: JJZkpa4TPqKJR0E4fSl_KA_1777408705
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8acb26fbbb2so175940426d6.2
        for <imx@lists.linux.dev>; Tue, 28 Apr 2026 13:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408705; x=1778013505;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b6d3l70lYqSnvJpMpEGZJLw4o8TwsL0Q+e8A9O8Mofs=;
        b=JbdKb28dm3FNJezu0a2c0PkNWKEl6i6prJ+OqS/Dj60NJkEHHRR9jfLBTdJnVyhPu7
         rPcuoBfaSxLLOsKByTzVMmj1eXnufqbjyc3K5QRLXlLWYkMOQuGmmEn4i3a0R8QCUfX7
         kmK6ZAPpCUjbj5CSDo+ys+GFg+UEAiWO+rUENKK1BjYu9XJj98RxchGIPPHdFrw9Tsfi
         mnSukDJGyGKhhXE9BLP+RB+oOTiZObc7etqlB5uLQVCKh2BLs+qBUNp/jpTqI9qSYDIP
         Blf5nbnVHNGWEWQSvdxSc76Dc11qKXLNJjn4TNr3kR4FkaZEp7vgVzJOgeE687vKO+Ss
         8/Eg==
X-Forwarded-Encrypted: i=1; AFNElJ+9FFxqRL+E8Gp2YiWkEd9xUEXpzUrPPMzyBU48GDQk8CZpmrsUEwEk2a4oetN3rVexYtM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUPY+pqIx7NbdyKiRXglUsPGWhamOxQ0y/xsj826omn5PrZpGq
	dBW0qOv7IbUIctZMLmM37rx0p7+An1/zKOz6hkAqyEcqe8dcKXvuKN7qwb0x+KfCUwZeYHZchMv
	erO4OjC6eH6lQDya2nx6ydkvgKfqjy0sd1kfOjqKl2SAft4RMn/y3YQ==
X-Gm-Gg: AeBDiesg3CB8sMp2PHxhJowy8vLEwrH7/KCncV56YCd7HX68GeyzHdOvPDhE6Gke+zo
	k8zZhrdRInD9Hhyi8A88vS9OMxbFLbnztlI1Z8C07Oqbd9QhyEV5EOCBWpJ2yGv0D9/DJHhUDvZ
	vuTvoFvDj2uZOx2CD2WNuCGOMjX+OipsPJwyFYdSlv6FBt7w/kLIH+4t8Az68llCBxD4mK/DMN2
	XFKHs9CbyzNdAqf9MUdn7sk5CFgSOIAyVADcjPSlYOga/BASdJtIh1pcn8pvCeDqmYIeonnOti2
	DZHrFZDJBvGHLvCg2cZkGV7PGhvMc+5FnFdxOnbxNZXOmhvUvADmB5+36C0nABuhyqsuHXfoBJi
	hWo/4ZMkeHPvQ39Uggnhpgt3+4lU0OqM=
X-Received: by 2002:a05:6214:318d:b0:8ac:a914:c2da with SMTP id 6a1803df08f44-8b3edcea9a6mr22408026d6.2.1777408705537;
        Tue, 28 Apr 2026 13:38:25 -0700 (PDT)
X-Received: by 2002:a05:6214:318d:b0:8ac:a914:c2da with SMTP id 6a1803df08f44-8b3edcea9a6mr22407456d6.2.1777408705068;
        Tue, 28 Apr 2026 13:38:25 -0700 (PDT)
Received: from redhat.com ([2600:382:8104:bdc6:d862:7b9c:1d01:62e0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef7ef50fsm699056d6.32.2026.04.28.13.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:38:24 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:38:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
Message-ID: <afEau1Ny-7RTz4vc@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GxWAqg5f0Tqb8Bqz09ypJeE-i6XWYweeLGLq_6l4t-E_1777408705
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

On Mon, Mar 09, 2026 at 10:38:39AM -0400, Brian Masney wrote:
> There are some clocks where the determine_rate clk op is just an empty
> function that returns 0. This can be either because the rounding is
> managed by the firmware, or the clock is capable of any rate. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
> 
> Based on discussions with Stephen at Linux Plumbers Conference, he
> suggested adding a flag for this particular case. So let's add a new
> flag, and update the clk core so that the determine_rate() clk op is
> not required when this flag is set.
> 
> This series adds the flag, some kunit tests, and updates all of the
> relevant drivers under drivers/clk to use the new flag.
> 
> Once this is merged, and in Linus's tree, I can update the few remaining
> clk drivers that are outside of drivers/clk via those subsystems at a
> later time.
> 
> Merge Strategy
> --------------
> All of this needs to be directly merged by Stephen as one series into
> his tree. Subsystem maintainers: please leave a Reviewed-by or Acked-by.
> To reduce the noise, I am only CCing people on their respective drivers.
> 
> Note this series depends on 3 previously-posted patches in this git pull
> to Stephen for v7.1.
> https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

We talked about this change at LPC in Tokyo, and you were the one that
suggested adding a new flag. I initially wanted to add a new shared noop
function to drivers/clk/clk.c. This series implements everything we
talked about in person. The only thing that we didn't talk about in
person was the name of this new flag.

Anyways, let me know if you are interested in this change, and if you
want any changes. If there's no changes then would it be possible to
pick this up?

Thanks,
Brian

