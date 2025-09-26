Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EE12AD2C
	for <imx@lists.linux.dev>; Fri, 26 Sep 2025 13:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758893578; cv=none; b=NwaSQ7Z2HPHj1/Vm9Gfcq2vAl+BVnZkM+70gw/fcFCph8hX5TA4PvFUdkfiMC+dr9XS7QAmvy8hiIVpH6lnVyhABDWazp3EgsbkM91CPl35Sle3ESST5Zd//MxlJJn62DHw6JkQcSpS6EMdVgRzCwQl8Kd7dKwq/CCx5P4YKHpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758893578; c=relaxed/simple;
	bh=bCg5ZCDZlbBoeYRSDTBdcsJZdFVKVBO2mwH3cdLPz74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qC3E3sqnaZ9Dl5vkzTpEQdq5Od8Bi6/bemRNLac5UPXR8ca6yk12fg/GtshPz6DdrKKPmn2L0vOx1cUGCw97+gqb4rW2uyajd3LlIiO1vvo+EODKgczX3/+j7734HHYA7yC+hAweYCqDhA4Z4wjuGmOrz8+wihWb5jSJCws9qXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wUyAiw6M; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wUyAiw6M"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cYBNP0pt7z9tNq;
	Fri, 26 Sep 2025 15:32:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758893573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yd4Mx+jNOSdf6VCUIn0E+aIjOManxtZgx8FZ6L3wTIs=;
	b=wUyAiw6MOzMV6zf7lkEjnsjt+tRDVO6Ao57dGOEZTYgFMcEL65ECbBvEI/2WXzr8uXZO/W
	v1BEdJa66C9cq0i+QiS09TuaR84YYZxSmSI1HtIB8vuGqw44LAPcDzA2JmqeWZgYi7zuWl
	2PQUufCxWo1oDAu+Tauj9BxOqDiz1NehzBWN6FfwIUcPP6nXLE9FPI432+sKnK2vXSc+Lh
	JThwcs9VHk+BV24T7GI9J6u3hNVRYSFxLE3dwCJqdFHoGs20mIxI5u6lj1ppRuodwF0Rgw
	FSwRL4iQ3sdvK7EJAPupK1+g28EiZJfgoJeAYplUjKj4fxnq/UQcF4SmTbxLeQ==
Message-ID: <32fffaad-7738-4fa6-80cc-2f8eba7ca099@mailbox.org>
Date: Fri, 26 Sep 2025 15:32:46 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: airlied@gmail.com, boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, peng.fan@nxp.com, robh@kernel.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org, simona@ffwll.ch,
 sre@kernel.org, steven.price@arm.com, tzimmermann@suse.de
References: <20250904160445.1671f140@fedora>
 <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
 <20250904172019.58e5f589@fedora>
 <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
 <aMk1CISrn2_p0qzJ@oss.nxp.com>
 <c34dc4bc-de12-42fc-aaf5-50474dc53042@mailbox.org>
 <aMoTtr9KmdrgDUiE@oss.nxp.com>
 <c1a45cfa-a249-4782-b5c8-0ee2d173fc97@mailbox.org>
 <aMrDKkIoZvAlBD8d@oss.nxp.com>
 <609113fa-6af3-4e7e-b47a-45b3152d8581@mailbox.org>
 <aNZaatnVRRkaPrnD@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aNZaatnVRRkaPrnD@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 39f223dbff010fb2613
X-MBO-RS-META: 7t9f5dx43crya5tca76ssnuhq4bazs8u

On 9/26/25 11:18 AM, Rain Yang wrote:

Hello Jiyu,

>>> as the 0x4d810008 is a write-once register and whose operation has been moved into the SM side,
>>> so please drop the reset change.
>>> can you also change the label of the gpu node from gpu to mali like "mali: gpu@4d900000",
>>> as the internal driver use mali label to control the thermal up/low limitation.
>>
>> I updated all of the AHAB container, imx-oei and imx-sm components, and the
>> reset controller is no longer needed indeed.
> 
> thanks, please update the gpu node label if possibly.

Which label do you refer to, and which one would you prefer to have there ?

>>> BTW, does the dynamic frequency work well on your side so far with perf domain?
>>
>> How do I test that ?
> 
> cat /sys/kernel/debug/clk/gpu/clk_rate, although its name in dts is core.
> it is an read-only scmi-clk.
> the clk rate should be fixed, as it can be changed only via scmi_perf in i.MX95.

Right now, it is indeed fixed at 1 GHz .

-- 
Best regards,
Marek Vasut
