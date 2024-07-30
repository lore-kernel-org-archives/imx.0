Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2C5208DA
	for <imx@lists.linux.dev>; Tue, 30 Jul 2024 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722334630; cv=none; b=eSJDxQ4G1P7iQP2Ou1FS0fIxHQ5diT6WlFyzrupBMZt4L/U1KRy+uCvgGISJ3dEiln6nY2mPvu6Q1FeEiqQPo8MklF2Jbn4uOLsDU+o5uOyF+KOG5sekutw//AGXmoXjgDaRwJvgEt1mvKR1ikN0lWgEgBU5NBLEIZ+kENmnkYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722334630; c=relaxed/simple;
	bh=O1OlR8VeoLhgbxQrA4eu8jb57Gk+Y9VXJQ1vYbnuVTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHTAsz4xKg9wpQ/zDOuzA+g7rTGXNnOdtmYud1OANbxT8mRsriH88MyJoPXu/20tHL+n1tbKurRXKqlgtBqS/vz0wSeQyFN9dajaFKzLB9wVqM5yqn4cVYl4BZ0cE6O1uzneB/oK4pHTI/0tJAZorchse+T43cRASkq4clE1N2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=nZPwBNcV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="nZPwBNcV"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-427b1d4da32so15644485e9.0
        for <imx@lists.linux.dev>; Tue, 30 Jul 2024 03:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1722334627; x=1722939427; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYJ2HN6zZjSZ2UpT7xqh96WlvTjmEszBOjYEwH/YEiM=;
        b=nZPwBNcVdSrHIkNbga0VH/o3rRiFN1zsT8Eprn7eh9qyQKTLAybyc8buxAEM5C7okM
         m6mb7+10ihu3AwIuHR+c+o9D2k2OD14LJ0dpUqyOGh1aF04/OX17M9ElU//RjNh7Q7I6
         7SPJ8j340bDPHQ6J/Uc2q7F+sX7bHGSNCmnek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722334627; x=1722939427;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xYJ2HN6zZjSZ2UpT7xqh96WlvTjmEszBOjYEwH/YEiM=;
        b=UlgeUv90jHV16fUA0jo62tNqOZQiMeoLlGBmtwvyvjyPg7NJ7AJqZhKCl1PJGONl7l
         zRqWv1rGHyqGoH3tlPiqCVsYAcTfXwfvxeF8QjBYX20oN6MJHPo62bss3a0RrOqpBiTy
         ATyNG1aOovDqITtQ5k5cvxWItk71LQr5QCJGq8ZEl3GzyNkYql/CtDLjt3onr3yWU3Q0
         Pq1wxrharhkC7zQFq4BHsFYHxCpH7a/lCiafWLjLBNBjM3kSgef1h+0bmA/styB/zKO2
         3TlE9cY0YjVTcFhqf4pbdoyuI5FM9VMXxh6UArkqR9DeRwgd7zxM0V58QWSiCJcgUdoB
         q9uw==
X-Forwarded-Encrypted: i=1; AJvYcCUDmPxoogBytpVJIMPtCqVg8Hrrtaay7ADQkbRT+4JsRMQU05GWqguvEvQsagGbrY+kRUjk47+T0fIN+A8bsFIthSiV
X-Gm-Message-State: AOJu0YxLhg5PFo3BEbyPXZSUtF3EBNYVGpSQgUSOBZmtRq6XTo1DYEFI
	h7kru0NKJmZvg4k49B7kJk2/adcimCa7lInFv3UvXjiQHBIcUI03MKCdzcJegsQ=
X-Google-Smtp-Source: AGHT+IEBPu1EpQnvKzMM32x1YaBFHH7ejLdTR7e7SQ9x2XM7YlUBd5c3doiAen1Jj9g/b+w0HCWL0w==
X-Received: by 2002:a05:600c:a47:b0:426:64c1:8388 with SMTP id 5b1f17b1804b1-4282442de8amr10454635e9.17.1722334627373;
        Tue, 30 Jul 2024 03:17:07 -0700 (PDT)
Received: from LQ3V64L9R2 ([80.208.222.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280f484cdesm145559885e9.44.2024.07.30.03.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 03:17:07 -0700 (PDT)
Date: Tue, 30 Jul 2024 11:17:05 +0100
From: Joe Damato <jdamato@fastly.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Wei Fang <wei.fang@nxp.com>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Clark Wang <xiaoning.wang@nxp.com>, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v2 net-next resent] net: fec: Enable SOC specific
 rx-usecs coalescence default setting
Message-ID: <Zqi9oRGbTGDUfjhi@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Wei Fang <wei.fang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Clark Wang <xiaoning.wang@nxp.com>, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-imx@nxp.com
References: <20240729193527.376077-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729193527.376077-1-shenwei.wang@nxp.com>

On Mon, Jul 29, 2024 at 02:35:27PM -0500, Shenwei Wang wrote:
> The current FEC driver uses a single default rx-usecs coalescence setting
> across all SoCs. This approach leads to suboptimal latency on newer, high
> performance SoCs such as i.MX8QM and i.MX8M.
> 
> For example, the following are the ping result on a i.MX8QXP board:
> 
> $ ping 192.168.0.195
> PING 192.168.0.195 (192.168.0.195) 56(84) bytes of data.
> 64 bytes from 192.168.0.195: icmp_seq=1 ttl=64 time=1.32 ms
> 64 bytes from 192.168.0.195: icmp_seq=2 ttl=64 time=1.31 ms
> 64 bytes from 192.168.0.195: icmp_seq=3 ttl=64 time=1.33 ms
> 64 bytes from 192.168.0.195: icmp_seq=4 ttl=64 time=1.33 ms
> 
> The current default rx-usecs value of 1000us was originally optimized for
> CPU-bound systems like i.MX2x and i.MX6x. However, for i.MX8 and later
> generations, CPU performance is no longer a limiting factor. Consequently,
> the rx-usecs value should be reduced to enhance receive latency.
> 
> The following are the ping result with the 100us setting:
> 
> $ ping 192.168.0.195
> PING 192.168.0.195 (192.168.0.195) 56(84) bytes of data.
> 64 bytes from 192.168.0.195: icmp_seq=1 ttl=64 time=0.554 ms
> 64 bytes from 192.168.0.195: icmp_seq=2 ttl=64 time=0.499 ms
> 64 bytes from 192.168.0.195: icmp_seq=3 ttl=64 time=0.502 ms
> 64 bytes from 192.168.0.195: icmp_seq=4 ttl=64 time=0.486 ms
> 
> Performance testing using iperf revealed no noticeable impact on
> network throughput or CPU utilization.

I'm not sure this short paragraph addresses Andrew's comment:

  Have you benchmarked CPU usage with this patch, for a range of traffic
  bandwidths and burst patterns. How does it differ?

Maybe you could provide more details of the iperf tests you ran? It
seems odd that CPU usage is unchanged.

If the system is more reactive (due to lower coalesce settings and
IRQs firing more often), you'd expect CPU usage to increase,
wouldn't you?

- Joe
