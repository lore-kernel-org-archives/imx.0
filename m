Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A68A3587C1
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 11:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769081846; cv=none; b=hhwc+zp0QxNJjC8CiXKDXsgEQkB6xSnGqo80n2Twc8RvMhboqRzD9pLw5BzkFNSp7ClKSsel4ikxJH0uIsMjJ2hp8DsBA0UFt5r2cTOXvVBZ3x7pnhxKL8qyCNg3pjCoSITcMBP7bwyQZsn8G7an3QAHysOz4O1RKcjHvu7ONjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769081846; c=relaxed/simple;
	bh=47vdssggo+h/Zlz7kBJBl5ByRnPHVor2xs5SYsppYa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O7hBI6UeyM4xeHbf25CZTdI7dEXtC9//8jBRhZmk/Vesw0wewr7lk1VAglUBrU0Z+TuBZB5zZhqaiSulugSvdNpIh8G2VWUKY6Iwh5NS/DylcvjyZxChn6vKdy97nfwR+4QduDuZ3BglB8CMo8GYPVgddW2fXpKFqD5jVOnkq8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NvVpSFwc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NvVpSFwc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769081843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0wNs9tyPabqN3sAug4aUnrZjg9O+jb6nYLQLd09yp0k=;
	b=NvVpSFwcVsuZzeXbByWp6S4i32vdSpFJrIB7mcxwInVMTc/a8Gt3ZHAZVfKeRWYO1FNUT9
	yqNPzoKcax7Mmi+rvb9fwZpbZTo88JLCf5yqV0hltrNJbqNBKxVj9YVOQIezep8Hcz6i3n
	bSrsG7T22EuxBRMqkIBahUQBLFmQDOA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-6VAIodLuP_Cx0w21u11QNg-1; Thu, 22 Jan 2026 06:37:21 -0500
X-MC-Unique: 6VAIodLuP_Cx0w21u11QNg-1
X-Mimecast-MFC-AGG-ID: 6VAIodLuP_Cx0w21u11QNg_1769081841
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-430fd96b2f5so856725f8f.3
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 03:37:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769081840; x=1769686640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wNs9tyPabqN3sAug4aUnrZjg9O+jb6nYLQLd09yp0k=;
        b=c8yZQRtGg9rZpA1wNSdc0FK/kzB+QRX6CfmMOZRnuNnrRAXXAFui0UfyjIBtK7VRoT
         0m4Ghh7g4yigkGnK8+UkrAPuCFaxLjpoo7ihPN/B5icF1mpfzUlwNzPcKwWBX088QEv7
         uecgbM3CscdcW08uxjh4dfGLQ3QKrU+UCsls6WoUJJ9z4NN0VhIa6VQ7uOutrdFSgiPG
         j1A66VdZNKSS3drdWLBE4LXL59DeQo1i9HN2aem81ikp4P4N6btFnxm7DCKkEwCR0qRW
         Qtw43ci6rpU2Jyl8P/+lCAp9d1Bra+5UG/zw4pJXwfjZ9wLSWHpDBfr9yJ7Dor4Jzd6z
         5XeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn5ej9QN73qXC0KSKNvu0LcfJiVNcWi4Nz0TOf2RWeF6rsu+iEHSpwilphmVTfMmGEVgk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwalQNuMzNUH2R+GHSyeBDqzD8HT4W/XAwdYUP7pvMpsdO0jySK
	TFFl5f2AXW1A99XOLFSgnXB3G9SG2UeSFQU07Q8DEk0rV0qzF45fkJHrNenQRdqkzXYptLFrj2o
	XxHjgZp4Zdxse2l72Nbkf36WOjfanQjusF7DZBkr4o+PiRTm5tB5CvA==
X-Gm-Gg: AZuq6aLzfKj1Q3x8KlYMC1i2JAwCA+oB/qKlj2BifO+hb3kYbQbeMxaSy6MExzD1J3W
	WS8N4+fp+zWxPhDd2kMZvf1hdFcdoH3UOEQJZLpv+QOsBJTsnTLf7guR8QGSVDM5st628GagQam
	7pvOOEotuYG6HPSU273AYglqLA4+x6rHLrvwd1KSfUrkyBZTtKO2sn6iPHb8cGGdZSl6GBkHalp
	amQQGgEgUVNcU+O5dXrE9nEgCxsg24yQRPsYEpieCGGvdYFrL9YRtw4L+cuz4J7FnoQ3PV32ugp
	FWuO7yO8uS35d0GUEYWOig6aGqUkGu+lyiVgqYSL3dHH8lkBaaBVQl4YlI2ZanRAbW5RAw1dPfI
	x+4ksRBjhSDmt
X-Received: by 2002:a05:600c:34d3:b0:479:1348:c614 with SMTP id 5b1f17b1804b1-4803e7f03fdmr128686845e9.26.1769081840537;
        Thu, 22 Jan 2026 03:37:20 -0800 (PST)
X-Received: by 2002:a05:600c:34d3:b0:479:1348:c614 with SMTP id 5b1f17b1804b1-4803e7f03fdmr128686445e9.26.1769081840134;
        Thu, 22 Jan 2026 03:37:20 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480424b18cesm51351875e9.4.2026.01.22.03.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 03:37:19 -0800 (PST)
Message-ID: <86b8feca-8e82-465e-a17a-b751758306ce@redhat.com>
Date: Thu, 22 Jan 2026 12:37:17 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] net: phy: add a new phy_device flag to
 keep preamble before sfd
To: Stefan Eichenberger <eichest@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 linux-stm32@st-md-mailman.stormreply.com, maxime.chevallier@bootlin.com,
 francesco.dolcini@toradex.com
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>
References: <20260120203905.23805-1-eichest@gmail.com>
 <20260120203905.23805-2-eichest@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260120203905.23805-2-eichest@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _wCGAKA5M8GTGkUWr9qpTnM4DKmJQIOjgQPl_rp84dk_1769081841
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/20/26 9:30 PM, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Add a new flag, PHY_F_KEEP_PREAMBLE_BEFORE_SFD, to indicate that the PHY
> shall not remove the preamble before the SFD if it supports it. MACs
> that do not support receiving frames without a preamble can set this
> flag.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

I understand this has been suggested by Russell, and LGTM, but still it
would be nice explicit ack from the phy lib crew to ensure it matches
expectations.

Thanks,

Paolo

