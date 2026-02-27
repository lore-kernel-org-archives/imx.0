Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48613491C8
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210332; cv=none; b=GB56oCr0lyJJnq34ccbCYQWMW/C9Ac1P50CLnphYjmOtigFYbjebPSoGzAISLU3qKOJKa8oQ9odX5vCcXc8XRNQn7qZjOZcUEeQKyyXjcO50lFA9UrQvB9S5I6oQYdS44/V7z9wsfBfLHiMnCbhASrTuL0ItVz8HMnt7RxEKRK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210332; c=relaxed/simple;
	bh=nR+w4zGkLQzjRTIc7kjY/q5/CbnV6sRdNO5FlWgP6N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=t8VbeMpKU8WZ3ziOugnLEAq/KeSPSH8MXWBoAEAjc18C1VNKCb7lMSstHeH2YEYUUdrFJBLQ+1y7Bn4QFeqpGvogYueJYiTtbbr+OL49/ORNKN88zKQDZEVQuZD9wM3N2hPw9NzGj1c3oiLlvO/RL65Ab6Wq5hmTBuVFsUd1KAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LwTSWEkE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LwTSWEkE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772210329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
	b=LwTSWEkERjiNucD0CR8xwpFQOH9g4g71BDRizht76z606tD42mNY+lrcQJTS9PlJuN+LtI
	1+3iaDYPPCUSvMomxx2/mRgx4ASVVkFhR695f2XsAze1ZxYBybq8xSFMTByykVle0442Zx
	kRwVrvcpwbNCPHp/loqVqqwBE8fFM30=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-FC20vR0dPLu6dVnuS2aW9w-1; Fri, 27 Feb 2026 11:38:47 -0500
X-MC-Unique: FC20vR0dPLu6dVnuS2aW9w-1
X-Mimecast-MFC-AGG-ID: FC20vR0dPLu6dVnuS2aW9w_1772210326
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899b4ce513cso214688766d6.3
        for <imx@lists.linux.dev>; Fri, 27 Feb 2026 08:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210326; x=1772815126;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
        b=ZmmHBhkuwXmUlDMmV4SZ9o8sP2HF7eHaIDbXaU8gPQQv2oAUARR7W2zFNgZKkVazTU
         YezxKTFV3PnsKP9mtIr5r8oQlysgJKZ1nEl+VoYqNcnU6oj+sm+d5aVWd+fHyKSRiutH
         JqJO8Tglz/dx1xsrEJ18iRk9nWQrVGQ/kdwoEckUwL0/xA/RXicM7lZD4gJG40zgYpIL
         5dbdH/tNtcZe0o5h2a2GWzuapTHBt7TZ8MSONawADlY/Ea1291NOMYUtWkFBTvVdS20n
         mWGZelSWS4aAiT+Y+Niy42RxjpGoLOQJOUwR+NZOv8Vm+QmvNuzzzdiJFtwa2CwM1/d3
         XL8w==
X-Forwarded-Encrypted: i=1; AJvYcCWwoBzAcXOpOHSBG5VCWK/ALSwZTSspZGXchWk68mGkEIfPiv41n5c8CfQwc30xN5NRGLY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBjmhAWjjcOcSrX309bbe8JED/aTMyMlkXU/MIo2bqyofZRbPu
	orAsQTU2yC0F+tFnjrJKgQVwMOjt5CwOHJQhK2PLNA6mtRPxAu7aOn2Ha87mNmlIZGQOm8Yyexu
	0NZayiAZQhdug4J3+QSNhZPSCp9fpkIzFgxoWQJlIwOar0hwTpnnUOA==
X-Gm-Gg: ATEYQzwquNz2RTVLzy1hOFK8E8cGzbFZhfzjr35MflXLDQbruqy/zhZUpJ+uHjf7osd
	uh9kW1a8nFS2dIq8kB2eooAx1JKNTd6ImVBUsGKl1voXzU1jlJmUtb4RQil5J7nGfv1BYzbcupQ
	+8WF72uncIKYwt5hmTWUgD2gUT+cqmeeLg5crJ59RptTkSgfJ0SDut/6vtF8L9mmnTFktMZpnGD
	V3cccjM4LOcININEdvP+yE+5+IlNlqRincQ3k3tTWR+XONkTUw3tWxVi0ZQ0B3yxgVNJeyz2Enc
	6VtmAsZvzaHlGiZEsvbV2CpX3b3AGKnOFSrRGH50F1F/6Y3nKVi5qD0rBTlLYJYPVVVxJT9LBa2
	H+049lZ3PrjJKSohMjUBmBWOIgiHgSCywmQdTgSKD7dEyX6eWheuMeS0I
X-Received: by 2002:a05:6214:21c6:b0:899:a57e:887a with SMTP id 6a1803df08f44-899d1d84730mr49660126d6.8.1772210326383;
        Fri, 27 Feb 2026 08:38:46 -0800 (PST)
X-Received: by 2002:a05:6214:21c6:b0:899:a57e:887a with SMTP id 6a1803df08f44-899d1d84730mr49659456d6.8.1772210325713;
        Fri, 27 Feb 2026 08:38:45 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50751256df4sm24041401cf.16.2026.02.27.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 08:38:44 -0800 (PST)
Date: Fri, 27 Feb 2026 11:38:42 -0500
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
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
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Message-ID: <aaHIkpuK7AFXbeM-@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3JI8qEFHoR9n3VY6OFVCVuCoaqH_1d6ZikMR4f6rkoU_1772210326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 26, 2026 at 01:16:45PM -0500, Brian Masney wrote:
> There are some clocks where the rounding is managed by the hardware, and
> the determine_rate() clk ops is just a noop that simply returns 0. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
...
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 1cda2c78dffaff037f0f16b0f11106b63b3a746f..187f8248a9c840c701cbbba99bb7cdeef7b654ee 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -32,6 +32,8 @@
>  #define CLK_OPS_PARENT_ENABLE	BIT(12)
>  /* duty cycle call may be forwarded to the parent clock */
>  #define CLK_DUTY_CYCLE_PARENT	BIT(13)
> +/* clock rate rounding is managed by firmware, don't require determine_rate */
> +#define CLK_ROUNDING_FW_MANAGED		BIT(14)

Based on a conversation in the Renesas driver change, I think we should
rename this flag to CLK_ROUNDING_NOOP. Let me know if there are any
objections, or suggestions for a better name. I'll let let this sit out
there for about a week or so before sending a v2.

Brian

