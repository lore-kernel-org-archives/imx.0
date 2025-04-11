Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448B71F3FC8
	for <imx@lists.linux.dev>; Fri, 11 Apr 2025 14:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744380419; cv=none; b=Qu2Y60aE4MvP2e8EIez0DklqXEqW4CeEKPJjXvjCRz7YABNblOSz9LYnp7o+3CGIh9gfoA1XJRdCCvPUuoRfH3SpPNQ3mnbfUP0JeArFpgk2+hi7Y5FHf3heulfnDtjBzziH+VOanaoQPG4wPCREUACgWqItW0JDPoD0cuuZKac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744380419; c=relaxed/simple;
	bh=NOvfAcC4nSHwovxfMmc7lJ6Xohxm7kKLQxmp9yLUv58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AqyQGLdwG0z9f3oBrl+9qpROKOG9uUwNhofACYTVQr94zcjeYz/L1P4v6R9orSQutz4SI3zBsLk1/tZBynJ/xI4b2ajt19Y8y1v3+kqnI0Lm1Uxy0dgYNl0otfbbMUztexNA5GFFVuPbTiWujUprxaoSlVA8Ppd1p6wHVGvcesM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUexOxIg; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUexOxIg"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso3679995a12.0
        for <imx@lists.linux.dev>; Fri, 11 Apr 2025 07:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744380415; x=1744985215; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOvfAcC4nSHwovxfMmc7lJ6Xohxm7kKLQxmp9yLUv58=;
        b=NUexOxIgRsVrSu6dARUhyr/YIcPUX8Vply8GZBGYzqND5O2vVvWIe317soRVfC5+NM
         WI79NdBOl0gI/tqNPhSRCYt7Q1FpnMcwY2nItiB+NDFQbIGVWlVX3gLBTiYOYug32I/A
         1xiVfk1p5o/TWeXahu68SSiw8bOFm45izyxvRj0bviHFmNbXp4nQIj5PjOiIyazOu+su
         tUZPurv2j/E1rkuqXqQBwahXHh6KrGJOArHi8TV4QGt8RO7ff95LFIaI0pC6/EIakMqp
         aXHY+aQVuKlRIQn/lUlmAYTYeSBooMBjnVO3pmz/XFWahXV7aJ4nWaTPMyRs+pDKtazR
         XtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744380415; x=1744985215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NOvfAcC4nSHwovxfMmc7lJ6Xohxm7kKLQxmp9yLUv58=;
        b=EkAYdwYkLAmqzYlUyxPTRem71I3K0QQUwTyKtHJxMAb0eRVlpNvnGzuQbM+0+aBPQA
         00SnCXwSP8inBeLWtO/lEu9dz9tKx25DrOfvzVXUSD1EuqO9Jlr+/P2CQxYVFqIY864W
         bQwDPsTPi6s5TY1IhRBqosmZNS/EyPUiVkYLrMRdzrxk1QfMKWMAXzamUEpA/RyLJhiX
         GuOALjC+PPFApTMgKJMBiCMgY5N2+D+/PKiGWstu/Z4qN4bZf8PirY4MheEyaG1owdcF
         euSpsTqWZH/SYj8aCJoJGp+vCbANAhyLvt6XxA6T/i8R93YoCdTgPtY34jnmQP/ticVT
         RC2w==
X-Forwarded-Encrypted: i=1; AJvYcCXi2/pyAid6MEdvwgr460M8KvV7uyn4AY6GvTeiS533yRCUQ2K96TtuhaJ+YhRsRxaPug4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTn6PsFnO4lPW1WfK95MzWutanLd+kLdJ4j8deVkeZEvJQ7IQX
	jlBU3qBjk5c7htawdGluFa1efxJJw+RJCvYnPjdEMHiBNa61GE2m
X-Gm-Gg: ASbGncuH3sbRZ0cxIqWTaaj0dEqK0tObPIG2IAUBE4qjBn38hZd+nxLbOPj1vMGUNgg
	1ZO5AZFnVNLfot8TiFFG38+AC6AR9dDeUuNTXO7Hb4wmtNcMJvcGA+ywntjWlE2hwOV1la8zJNn
	E/slR6n7UiVqxEX5uFvuRu1Z3CHxDgSvJjp1MtvHjxfpM4m0BuQ2qU/ObUDix8aSWiqeAcaKzDV
	iJf30T5PzTA+cakAjTcxzbdVSLE7e5w3V1JiHLMPQZlVxW/AKmYNCl2VeMCRz8YNncMXNEx2oeb
	yWeVfjWKZCY7VQI2T0OZ6VPEnlMJPiGKZsWPhLNgUjFgc8NsegEF/neGv9X5xAR85QK9jUl8PiZ
	XxO0jGtYyfA+1UnQzXg==
X-Google-Smtp-Source: AGHT+IE1yOeDj9VvnJ4cJ143MdQvjsuVm7s+alTj6cIAtIkzd0ZDaU4JF1U6ysR5rjPt1629SVONMQ==
X-Received: by 2002:a05:6402:1ecc:b0:5ec:9352:7b20 with SMTP id 4fb4d7f45d1cf-5f36ee45999mr2263715a12.0.1744380415128;
        Fri, 11 Apr 2025 07:06:55 -0700 (PDT)
Received: from ?IPV6:2001:b07:aac:705d:8db5:5583:1b6d:7bba? ([2001:b07:aac:705d:8db5:5583:1b6d:7bba])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ee54fa9sm1005741a12.1.2025.04.11.07.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:06:54 -0700 (PDT)
Message-ID: <2af51b9c-cde6-4347-b062-daa87bddd8ff@gmail.com>
Date: Fri, 11 Apr 2025 16:06:53 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
To: Carlos Song <carlos.song@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Francesco Dolcini <francesco@dolcini.it>, Aisheng Dong
 <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
References: <20250319145114.50771-1-francesco@dolcini.it>
 <20250411114738.GA43965@francesco-nb>
 <FRWPR04MB11150B555044300A70102DAF5E8B62@FRWPR04MB11150.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <FRWPR04MB11150B555044300A70102DAF5E8B62@FRWPR04MB11150.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2025 13:55, Carlos Song wrote:
>> On Wed, Mar 19, 2025 at 03:51:14PM +0100, Francesco Dolcini wrote:
>>> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>>>
>>> Rework the read and write code paths in the driver to support
>>> operation in atomic contexts. To achieve this, the driver must not
>>> rely on IRQs or perform any scheduling, e.g., via a sleep or schedule
>>> routine. Even jiffies do not advance in atomic contexts, so timeouts
>>> based on them are substituted with delays.
>>>
>>> Implement atomic, sleep-free, and IRQ-less operation. This increases
>>> complexity but is necessary for atomic I2C transfers required by some
>>> hardware configurations, e.g., to trigger reboots on an external PMIC chip.
>>>
>>> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>>> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>>
>> Any comment on this?
> Looks good. Thank you for your work!
> Do you test it at some board? How can we test simply?

We tested it also by using the xfer_atomic for "normal" transfers
(.master_xfer = lpi2c_imx_xfer_atomic).
The driver is used to drive multiple buses with different devices.

Emanuele

