Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E5E205ABF
	for <imx@lists.linux.dev>; Mon, 16 Jun 2025 15:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087950; cv=none; b=SBwCGpgechcp593vVUfiNvpNP04+bXPdIvgo2t/29QP2Rpve2jS9OtxCzDJ9vNfaS7POPV/jxURHAeNTxyzxowqJtR67XqfgpSo++9uci8cQ4n/H3KPo0tRDnZqZkx8LdLJ/XpiafwdOCDuNOTmwWpglt/gTxBm1DGA5O739cd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087950; c=relaxed/simple;
	bh=C6QPic8D5Dr50NLEToijBW2WnLlcIvUtBHNraPM+3Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ji1h8P4SdyN9i0kqiW2BjBVMN2CJrFYXzwGDLPU4dYERa6cWMCY1IeELKf9Hk6Pc+HeTSx6rXzFGd3OnClBblOgP+96vU0SXINshfvOifbJ6FZyyqMt0WF3EKWF8du5/Q64lYYpFWAlCKLz9VNj1NWPuukw3cfA9zQUwV0I6xKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZkXFR4f; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZkXFR4f"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so40500705e9.1
        for <imx@lists.linux.dev>; Mon, 16 Jun 2025 08:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750087947; x=1750692747; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9ECxgnlBEPN1ZzmbVKIFZnjMrIIq7xUCsgOdWC4cAE=;
        b=iZkXFR4fsimSOJZzFkGrFjnPoysRbbnwULIJBUhSJlpIKeQdbs4VqBI5coJyUZUAov
         Dy1widKVWQT59O7pOrtMdzjKbkQSxCZ4PDi4SY8W6mcRPAgNccaKBG5DlJaX1tAmEUZI
         PUMohXtNj9abzDFatydFL3UDrb4Q4vQhcNY2MMRiklC/OjMgVHiof7J3XFUfAhOUklQ4
         tKYoqdL44N2rKDGfcXlLRXv1mVxb6cxxh3kWeXzWexj9sQo2rDhbYQqd0sezIwK/yBKk
         SiiJl/gVKHntzbp6eCBx8HKaAbulqXFe1KDO9yPcI2siN8jQS3syU8hu19RMBYpDYw55
         VkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087947; x=1750692747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9ECxgnlBEPN1ZzmbVKIFZnjMrIIq7xUCsgOdWC4cAE=;
        b=uRG5N4a/v4ycPLB/eSBufS5wejywIyI4T8AO9GivzLxt6agn0vKzDIVXvXUOmidjQT
         hmj9IqWCyy7mObhqJe8/gC04KCWwvpjFnBjP8xiMmUex+xn1L8kSGsve5Mj5vZsIYefl
         6GCAjlb1JiIqYsVE+Y5R8480/zLN9T8dAQ+EmI8REQ+wqdoGsO6jjUl53/No/yU6XVh4
         alqHi5/UVuGWeMhsuAvxQ3lcofNSiB6XQOP9mChkqqB48UYk+5V7E/IbUxrR3D+z7UBK
         xA9OnJrrw3rXW//JHVTVCAAKh3Qr7zqcOx4bV1uBYpKMd0ZiqXQgPGWTZaZA94mkc5VY
         lOVw==
X-Forwarded-Encrypted: i=1; AJvYcCXKfQJmXYhxp4aw0sw/rjoiSDVGbJMVCaQCtwavwrrjshjV+6NF1u9/OAuD5yrcAU8EFrA=@lists.linux.dev
X-Gm-Message-State: AOJu0YydS1tHZ7dm8fXSr5v3vlMBxEnT/yJVRL3P+8nz4/P6ZUwi8TZa
	+Bw3fr32PEZdE51asWZVXRR1RxV6TYQ+lcpRBoPteoiJl9BEnnqbc2kl
X-Gm-Gg: ASbGnctDz/CxIssXRlT9RphOw84+cVIVex+A6iCJfx9nNGUoCU5Duvob6tfnm5dhUlc
	FqTfMUNp0d3T1L6NUZ98AoYhdQTZbXN/jDWY9D65/gU9q/i3bR6dVdY2s/XfUpIYHU6wXb/MlgM
	1zYBLA2KCaNBC07Q81YyCwZbbDKIol5DneoA43WjtyLhcMHagXXdedS/v4nm24tUmGhNJu8JAe1
	8P4dfsTCbLoP96YOPkzzElDcCDeydKax7W3VgtjZADV7P78oJ+nwvD78KbMblgEajcILuWMmjJ/
	E1azbaDVSxAwyHPGiszOBtKuBrHrE7OdvMBDPE8K1wlcpE+EKo5ud4uy/zAngjqKl1GbplAK1Hp
	r7578ih8Jaq83S51Q0GDb30ekCHaptmCN8CLcvfA4CdgubOtFGw==
X-Google-Smtp-Source: AGHT+IHkq8LrLQrzxsyZlo9tlv7aQOJfSxIwHgrNYLkM2fTsGTC8YWwjLvcQgoK3b9PbquhF+UHucQ==
X-Received: by 2002:a05:600c:4ed1:b0:453:78f:fa9f with SMTP id 5b1f17b1804b1-4533ca510afmr88788005e9.11.1750087947230;
        Mon, 16 Jun 2025 08:32:27 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a6078csm11245581f8f.21.2025.06.16.08.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 08:32:26 -0700 (PDT)
Message-ID: <98a48c7b-539e-41b3-ab3c-e2398401c7f7@gmail.com>
Date: Mon, 16 Jun 2025 16:32:25 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 6/6] eth: sfc: falcon: migrate to new RXFH
 callbacks
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 bharat@chelsio.com, benve@cisco.com, satishkh@cisco.com,
 claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, wei.fang@nxp.com,
 xiaoning.wang@nxp.com, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com, bryan.whitehead@microchip.com,
 rosenp@gmail.com, imx@lists.linux.dev
References: <20250613005409.3544529-1-kuba@kernel.org>
 <20250613005409.3544529-7-kuba@kernel.org>
 <6425933b-3b17-4509-86be-be4a75f12e17@gmail.com>
 <20250613075010.0b59564d@kernel.org>
Content-Language: en-GB
From: Edward Cree <ecree.xilinx@gmail.com>
In-Reply-To: <20250613075010.0b59564d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/06/2025 15:50, Jakub Kicinski wrote:
> On Fri, 13 Jun 2025 14:44:40 +0100 Edward Cree wrote:
>> So granted that you're only moving code, but looking at this it doesn't
>>  actually make sense, since every path that sets info->data to nonzero
>>  also sets min_revision, so why not just do the ef4_nic_rev() check at
>>  the start?  Answer, from git log spelunking, is that when this code was
>>  shared with Siena, EFX_REV_SIENA_A0 supported IPv6 here.
> 
> Ack, I was tempted to clean this up, but it felt slightly outside of 
> the objective. Looks like I need to respin for enetc - I can change 
> it in v2 if you'd like?

I'd say just keep your patch as is, then I'll send a follow-up that does
 the refactor and also adds a comment about why the hashing config is what
 it is.
