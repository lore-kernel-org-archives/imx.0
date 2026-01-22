Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664CF41C2EE
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 12:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769084641; cv=none; b=EJYUmzrJTuR1Ftu6GTVgFlN2K7eKqZHqk06D2gEVh+fnNVFdMxlUE9annVYqOyVciemsfVbsqYr9WO/m/g6cPr7rFRj/9iAJUm6mHLTpaLBIZJUQ7TFLuGzMYUMEBIi2Q/sZp7uv2u/NDKWbXxZJP3GEo9Dl1rP3A0ErSyp4bZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769084641; c=relaxed/simple;
	bh=CbkhgR46Zm77/M+4UC5otkqe5oqfCe1CQTunZhwtgeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tr9PeeMdzuxipNIPnPRoKmPw7+45Fr2OwSnadS4V6nLPBYEVyeEn5Sup49SOJRyg0McwAvJUx7vq8m+oEbEPleQkLQgOBPPopNgW8z+VttelIwiWnu89e5z2cHC4eZWYGzGcY2588vDVakw2bNcVGAx11YFKJhykm8EvpvZBopQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cgkKq1ND; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cgkKq1ND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769084638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HDkVo4hJqKcY8aS9Cps8su9WoS5sFWEpHKQyTLCzYYY=;
	b=cgkKq1NDdps5T4cGsdCM+4pFOSQWgCF4rNC6fWuIhi5BhQx88dAaJ9BF1vQqxO6feiFpGM
	BpKO7i6l1wrMSYZITofKQcZttjAFDq2QAQS2Ir2d7PHj7puPuuRDnV2R6oOfjKpGTMiTKH
	y1ycGtSKiLi4jzNQESQxXrtA5jZaKPg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-BVRCttA9PWGRgHpntX6nkQ-1; Thu, 22 Jan 2026 07:23:57 -0500
X-MC-Unique: BVRCttA9PWGRgHpntX6nkQ-1
X-Mimecast-MFC-AGG-ID: BVRCttA9PWGRgHpntX6nkQ_1769084636
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48025e12b5bso9517705e9.2
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 04:23:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769084636; x=1769689436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDkVo4hJqKcY8aS9Cps8su9WoS5sFWEpHKQyTLCzYYY=;
        b=ijIgJsrhX4OEuxV8bLVj8yqAWDRbwu+mfm0J+wxyjN4L4nmjbRfaVJYZb1Gq0omVlc
         pnw2ifFo7qkjQHIIOMpp2RitVIKGYEg7G/tR+Ruj+YTdJTsk1qpnrE43vL/JEdeqAUM4
         rlVygamWcGJTajHeApWYKp2oh07EyY+eEl4Df6zrvHhiQ3OPiAwuagr4gad3rNvLsCRX
         qIigMIcOMFKCF6jrPGeG0P2ElOKwHpvDYORhTBegKb09vOyDCk8EpqdwoO7VMYD2kZWJ
         K6zUJHh6yXPmkZC/NFpd3R4GmpFuef/PXP8Ix6/OREoVMgbYH+Xez+xxMibh16rpcmgF
         DPwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqJ3SzyoSSsYQ1IdgWJlDku1WAIKXItV7kxqHed5Oaaapy8KI+Mmz5olH2SAa82HtM8nA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0HQblC0jIii79jUxZ/aAr5A0ZVpM4Bpz209uWmy8R95solHwM
	Euzyo6P1lWiMFP/IXYyfMTVqfy4iVOR+phpM0DbftjmjlDnZ5/G5cgj/mYEFB/63lj3KSlaLDAg
	kAySQkg3NStCiaykI03WTB9zKTmgsjsSShfZt+BGebk4Rwp0tsl1Biw==
X-Gm-Gg: AZuq6aL02czDsC2Rd3SpuXbhSzESgxnhMQ4i5OujSIV9okYEFybxuquNdds9oLHZ5WB
	fIlTWO+LQV73yBh/oaKi+uMt/8gnxiCC0a4wfZig5+01rgbgHeDFNvlpNjk2hXVSbXHD9hcQQkX
	ScQAQfOW3okrSb0vk2+U3xu7CAgor+SK81SCuHtdvBWBqCN5GilIZr4AtzXCt5XCj2cU+16We/O
	n/xLwhUc2Rf4jLH9BCSX4v5WS5owTRZytdu1ntG+taT+qEAmgLA0J7aRKAE1l4EkgBoOfhj9MB6
	sWVkXLpUyyQ03ak536SdOLNFzoUbBkqyNs4JTPxT+QsCiLqx0o6QpKO+E4v5AD4hZ7ClPgC1LdL
	vaU9KjdpFyxJ3
X-Received: by 2002:a05:600c:821b:b0:47e:de9c:92ec with SMTP id 5b1f17b1804b1-4803e7a39cdmr145313695e9.14.1769084635672;
        Thu, 22 Jan 2026 04:23:55 -0800 (PST)
X-Received: by 2002:a05:600c:821b:b0:47e:de9c:92ec with SMTP id 5b1f17b1804b1-4803e7a39cdmr145313225e9.14.1769084635263;
        Thu, 22 Jan 2026 04:23:55 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997ed8bsm45340078f8f.36.2026.01.22.04.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 04:23:54 -0800 (PST)
Message-ID: <578b5c27-0db5-4185-ad3b-cb35bf864d18@redhat.com>
Date: Thu, 22 Jan 2026 13:23:53 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: fec: account for VLAN header in frame length
 calculations
To: Clemens Gruber <mail@clemensgruber.at>, wei.fang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org
Cc: shenwei.wang@nxp.com, xiaoning.wang@nxp.com, imx@lists.linux.dev,
 netdev@vger.kernel.org, stable@kernel.org
References: <20260120160407.101273-1-mail@clemensgruber.at>
 <20260121083751.66997-1-mail@clemensgruber.at>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260121083751.66997-1-mail@clemensgruber.at>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yaH24fJCvfRZm6BeRSQ2s6TMxYkTh29urlP236PnjX8_1769084636
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/21/26 9:37 AM, Clemens Gruber wrote:
> The MAX_FL (maximum frame length) and related calculations used ETH_HLEN,
> which does not account for the 4-byte VLAN tag in tagged frames. This
> caused the hardware to reject valid VLAN frames as oversized, resulting
> in RX errors and dropped packets.
> 
> Use VLAN_ETH_HLEN instead of ETH_HLEN in the MAX_FL register setup,
> cut-through mode threshold, buffer allocation, and max_mtu calculation.
> 
> Cc: stable@kernel.org # v6.18+
> Fixes: 62b5bb7be7bc ("net: fec: update MAX_FL based on the current MTU")
> Fixes: d466c16026e9 ("net: fec: enable the Jumbo frame support for i.MX8QM")
> Fixes: 59e9bf037d75 ("net: fec: add change_mtu to support dynamic buffer allocation")
> Fixes: ec2a1681ed4f ("net: fec: use a member variable for maximum buffer size")
> Signed-off-by: Clemens Gruber <mail@clemensgruber.at>

A couple of things to remember for future submissions: you should
include the target tree into the subj prefix ('net' in this case) and
you should avoid sending you revision in reply to older ones as it may
foul patchwork.

No repost needed, the patch looks good, I'm applying it.

Thanks,

Paolo

