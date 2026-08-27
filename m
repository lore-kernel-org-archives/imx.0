Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA1C3B38BF
	for <imx@lists.linux.dev>; Thu, 27 Aug 2026 08:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818252; cv=none; b=irnlRpP2dWjH2dXWwInuBhBGk/jMaJ/V4ybElXtXqOVkwTpn+AnFLuGO/pRcf/zha8wseWjCiug5E6UtxXJBlsM8YL/AONsZmEbZDl/O6z5Kc3opDdNNT2R0eA0CSh/MomKDV0CGB+nu+VZ7lEqEMJ55zbTQ0e8IXc8ScMBs0uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818252; c=relaxed/simple;
	bh=v8DlLY7ma2LyAtWyVwiNsJ5k6Cb0yYYgQsJlQMG0xg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UcIWkVB3dT9UZiLEFsBpDRg7WM//zDAzx7j0NHEgevOjITcrAm6onvXp6mxZPYksFMwo1+Nwf3UccCSzsv/MwWjIk6t1igECVnUnc/IStjjDUY/HW1GSnV0hB5yazmWijWpv/A/3qBjvZkGM1T36DG4Sim55Y7qdauXVhbCy+q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T959gXAv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T959gXAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787818245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LjEuQn0GyYN4mR6spCUyGj8pF4DNE5yUhyvyjSUBEAA=;
	b=T959gXAvR+JCe9ik2yU5vhDMa07s15+Ss7nx1HuZr+rqWBJ28/JJGfhuwk3IWGrq7XHsOT
	8rj0MeFLT8/JjlXOdueDfksP1uvceV6JA94qV1s8pl8TTYk/7CwZVAvYyiZBDFh4kXqptx
	mrDVzoeLrI3omYx+eRVefQRvea2drzM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632--WnLC5KFOjGb_1debu04QQ-1; Thu, 27 Aug 2026 04:10:35 -0400
X-MC-Unique: -WnLC5KFOjGb_1debu04QQ-1
X-Mimecast-MFC-AGG-ID: -WnLC5KFOjGb_1debu04QQ_1787818232
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-493bfc3b84aso2613365e9.0
        for <imx@lists.linux.dev>; Thu, 27 Aug 2026 01:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787818232; x=1788423032;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjEuQn0GyYN4mR6spCUyGj8pF4DNE5yUhyvyjSUBEAA=;
        b=tHKwQfDVKFykP4KlqDJ9/hbnw5J8BWMSxXu2dHwRztSeDnbkGGa/+JZ6An1YfS9xJ0
         ptPnTgXtGllrogqUyHQC7cRS7a1OzMTzrK3m2nL2a2oK2WQ8W73YM1cl7SExZtyp892s
         HVV4/E57GVFQfrH3LlCczVR2lV6uZg5gAb8DUr1uyqcVHkAZ1PdHxq2e4up0HEx6jzuk
         TPXg2/HbCJiU4xmpu1ljSvBxzkwkQkRs6EnvTT4jiUMiR8AsRMSfVDoNvtfUnHb/UOSq
         Zf5qqJ/UK1iPZKMHlvm5YiLiRNuHbYsJsCdF4Ef8Oc7tmHHTV6Jx1GMNjUeoggK/4xu6
         rGKQ==
X-Forwarded-Encrypted: i=1; AHgh+RqefY9kFKQLvzvAFCEluF13qcRmsmE2nUziKTMgFQhdgssZA1gfLxSsISBE7/XfEO5HV48=@lists.linux.dev
X-Gm-Message-State: AFuF++nfzs+zrYYjZo2cbqqLDtfLXLFxSAuSeCfaN9qe4GY6A7k/aGDW
	VS7llCMhKz1/Iwzba1yY0rDx/Z68mwN3eDZ5/3Is74U5PrSRKXatneaNkJ6eN3b2iYWP0r4fuh3
	19GSZBsIMRbtDiSIYOPyYEYXoRPFwwsdkuerjgjSil21k0xT+kXPfPQ==
X-Gm-Gg: AR+sD13uGJ00uv4lRJBZiz7ACGLzQ93cNSKo1Ha0ElINWgSNicsafWNwQO8NSDPpj0O
	8xtwCVKFiwJS+l6odxpt8ednWHGNszh9ojJXMfhUi/6WVb0X6plwJDiOic6ijSZLZKcAcTihay4
	6woSwL6EM8RV+AoXl5haQRGn3x2NG+byidiRHiS1n7LQf+QsXT/8yT9ej00U6ggrUYflR1Yk0xu
	vgU+ef5DiipXbbVpLJ1ELYCwrXuoRlfLzYGK//R8BFkSMoY06aoNmDRtHE2t0p6oUSTGSGw4Iz1
	XQ6ETtQF8IgdjykE4CL2HRdFOHM9HFgTHGfchB1e0smzb3L9q+2q9PjAWzxuwoqwkPFVXBY5f+G
	RoafnzY+RfrK6iGLHLCeS6G+y+U0m//h791xtd9WmUK8bBi2u5YCGEnZjlPejuaMul9Et4Xg=
X-Received: by 2002:a05:600c:a43:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-499dc717e27mr129887105e9.9.1787818231663;
        Thu, 27 Aug 2026 01:10:31 -0700 (PDT)
X-Received: by 2002:a05:600c:a43:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-499dc717e27mr129885015e9.9.1787818230497;
        Thu, 27 Aug 2026 01:10:30 -0700 (PDT)
Received: from [192.168.188.103] (ip46-47-231-195.pool-bba.aruba.it. [195.231.47.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56acedsm61647295e9.3.2026.08.27.01.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:10:29 -0700 (PDT)
Message-ID: <69d874a2-dc5e-45c5-8f94-418d5a73e738@redhat.com>
Date: Thu, 27 Aug 2026 10:10:28 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: fec: support RX flushing via an ethtool
 private flag
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, netdev@vger.kernel.org
Cc: Wei Fang <wei.fang@nxp.com>, Frank Li <frank.li@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260825091908.1362677-1-alexander.sverdlin@siemens.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260825091908.1362677-1-alexander.sverdlin@siemens.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V2NCpIqpSC6CizMCzaigLsc8gIHTBeTlUVlCydNSdgc_1787818232
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/25/26 11:19 AM, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> The FEC controller can flush the RX FIFO of an individual receive queue
> through the RX_FLUSHn bits of the FEC_QOS_SCHEME (ENET_QOS) register.
> 
> RX flushing prevents frames in the RX FIFO from being blocked. Blocking
> can occur when the frame at the head of the RX FIFO cannot be forwarded
> because the ring it is associated with cannot accept it, i.e. when the
> ring's RxBD[EMPTY] is not set or ENET_RDARn is not set. When RX flushing
> is enabled for a ring, such a blocking frame is flushed (discarded)
> instead of stalling the FIFO and holding up the other rings.
> 
> Expose this per-queue capability as a runtime ethtool private flag
> ("rx-flush-qN").
> 
> Due to erratum ERR050395 (observed e.g. on i.MX8QXP), enabling RX flushing
> on more than one queue at a time can lock up the receive path, so only a
> single queue may have flushing enabled.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
## Form letter - net-next-closed

net-next pull request for v7.3 has already been merged, and therefore
the net-next tree is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 31st.

RFC patches sent for review only are obviously welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed

