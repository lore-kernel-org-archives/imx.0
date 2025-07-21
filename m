Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34B52D6607
	for <imx@lists.linux.dev>; Mon, 21 Jul 2025 13:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753104361; cv=none; b=RGjPCRlPmQfRaHXRWk8CL+nF0tySTM59pRSKHaHkIR6PejaNcPWFw1La63UdlZ/6zAZ7RlFXe1CNo0co9iONo79M9/1DyZZgLXbdfd30bcKzGxrWF5AsPwWQfe9bUiZaz+UARafJIZboUZvhwLArcSKQy/awDjGaZA5DkAhC5z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753104361; c=relaxed/simple;
	bh=CgTHlnjqXlrhyYXlIsSOMJg+dqhEDhk8I+VMOO7ZHLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cC1qZDXfiv71lDZrdTo+bZm67qT3JICY6zQ8oBZxS4ehDdz/seNtqebzzKL96r0Oqh6+1Np8D6aLdqmEXwf8EHHtE66IRBMhMBqoWWMdg/qdUkM1zVRDxT3vD3XI47MuiUsn0f+EzOrcATszc/r8mLKu1Cyjoc4FAlWizqdqUBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l6hBXEQp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l6hBXEQp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45610582d07so33763025e9.0
        for <imx@lists.linux.dev>; Mon, 21 Jul 2025 06:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753104357; x=1753709157; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e1nIdAg0sGnGTxCABOmv04iQ5WEkBiWRfTjeSG6hZ6w=;
        b=l6hBXEQpUjE6F4buANcHReqQdKG9lBNqFY7lAdv+HgMnm40g8iFbUqho+noMGFjAKb
         PpszFyWMroaGNp0FIkFUkHR972u5/jefg4HC2VrHbWlAux59KdD5QHKhJYuTm0cSaNoq
         rOHy0wONIQyAEKYmCAN4p2pWfB2LvYxcEx4QzmWPxamM7huSmeuKZ7VMTP0ZevDj48Xd
         SCdWfeRo4Dol3qVRRKS9W7GzAhHX3+qgyrriF/WUgpakkUT9chdoCkSmiqZdtp3TX1iF
         hm8bMEZtFBQYnGj5dYfBnsppcHcHugk9YzIoPa9Pqjk+saoezFoclZLhLKDwopGg7pJ4
         xtuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753104357; x=1753709157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e1nIdAg0sGnGTxCABOmv04iQ5WEkBiWRfTjeSG6hZ6w=;
        b=vbJTpqlfWfIrRzmgGYAE8ivDOpocM2QLwCOYVPk29q4u28PJAxJ6A9dqfj0kv1A/Lg
         it43zn2O1tVO87jMLjuEe9npl5VAawWG5HtpCELICdeQu42ScCQaghCJxYO+MfqCRewq
         6tkSvDoU2JfqZ6WDehUjjUb5/a8VpXXd69drOozQMp/WZR2HEoNf6Zici9GBbzxJJoZJ
         KDmox9rcM5IWnGsk7MLNBVC7u72T8fET5EJ2DlRMnwmWfAZgzWNRFx8qUMT9SM/oT8Gc
         50K4c822o9XYvQaLIIdhhzPlvKvtVXhRw6JdYs/MzZBwrrsUSc5UrqwIQbDugsBsfaze
         437Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwkCyvjXGzDm4wcjPqXRL3WRzEhClZ6Y5JG+VpBrYCY+LekkHy5CChSB35r5oYb7NLwCk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyobJwhn69ISHGMq7PWEjeO3iIDGvBcjDzkgrZVmzZGV5YLH2pi
	VXuGPFhGuvDJxy5sj5EczN8u91QP/iey+gIgEf0PN6rMeMDn7HY+G7dMR8Y5J4F4g4HSxKLl43k
	ILsmVBas=
X-Gm-Gg: ASbGncuM8B53V/OcSUgw/jxnGMF0zDx6imLvDu01LObahBvSZF4pMN9Ilgx2qzepl2q
	WQ6EEhxj1MUAV/pZrm/oTZxxZe/k4RqF0k3YxPc/dR/0Knh0BDluE8ngmLA/EvFvKy8JHrk71HM
	08FF+JaTorVOZHD/7WvAMdfspWa8XTqpcYYlb1JqFI4WGTsskMRLiBdBumUg4i+zkKlyuI5pj4y
	8r2cpFGuDwwrCpgo+DauBma5uv8emkjRMkGeVpgdDmeI9moyBPJ23UEVw7Eg1H/ILnOYiSic3uW
	w0HsHISa/RrM7/czKno7GPruKCajlkPOhigDV2k/QM+k/lzktvQBqaBZMR0YTRvJt+5u9ucCj6C
	bei/HjDIv3an4nnfgTZcJ6OTjREk=
X-Google-Smtp-Source: AGHT+IFTflohdCxvNvNb8RYTzDCG+r6gd9qoG/lJIe4OeYl2GcySLLIOxdTc/nCyWsZxvyoNDRS5RA==
X-Received: by 2002:a05:600c:8507:b0:456:161c:3d6f with SMTP id 5b1f17b1804b1-4563c266ae9mr112757965e9.11.1753104357063;
        Mon, 21 Jul 2025 06:25:57 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b5c84absm102784195e9.16.2025.07.21.06.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 06:25:56 -0700 (PDT)
Message-ID: <eb704af4-5800-49b6-9915-c990c5b23fa1@linaro.org>
Date: Mon, 21 Jul 2025 14:25:55 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] spi: spi-fsl-dspi: Store status directly in
 cur_msg->status
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>,
 Frank Li <Frank.li@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
 <20250627-james-nxp-spi-dma-v4-2-178dba20c120@linaro.org>
 <20250627213041.vp6yfcgf4xysdklf@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250627213041.vp6yfcgf4xysdklf@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/06/2025 10:30 pm, Vladimir Oltean wrote:
> On Fri, Jun 27, 2025 at 11:21:38AM +0100, James Clark wrote:
>> This will allow us to return a status from the interrupt handler in a
>> later commit and avoids copying it at the end of
>> dspi_transfer_one_message(). For consistency make polling and DMA modes
>> use the same mechanism.
>>
>> Refactor dspi_rxtx() and dspi_poll() to not return -EINPROGRESS because
>> this isn't actually a status that was ever returned to the core layer
>> but some internal state. Wherever that was used we can look at dspi->len
>> instead.
>>
>> No functional changes intended.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
> 
> This commit doesn't work, please do not merge this patch.
> 
> You are changing the logic in DMA mode, interrupt-based FIFO and PIO all
> in one go, in a commit whose title and primary purpose is unrelated to
> that. Just a mention of the type "while at it, also do that". And in
> that process, that bundled refactoring introduces a subtle, but severe bug.
> 
> No, that is discouraged. Make one patch per logical change, where only
> one thing is happening and which is obviously correct. It helps you and
> it helps the reviewer.
> 
> Please find attached a set of 3 patches that represent a broken down and
> corrected variant of this one. First 2 should be squashed together in
> your next submission, they are just to illustrate the bug that you've
> introduced (which can be reproduced on any SoC in XSPI mode).
> 
> The panic message is slightly confusing and does not directly point to
> the issue, I'm attaching it just for the sake of having a future reference.
> 
> [    4.154185] DSA: tree 0 setup
> [    4.157380] sja1105 spi2.0: Probed switch chip: SJA1105S
> [    4.173894] sja1105 spi2.0: configuring for fixed/sgmii link mode
> [    4.232527] sja1105 spi2.0: Link is Up - 1Gbps/Full - flow control off
> [    4.312798] sja1105 spi2.0 sw0p0 (uninitialized): PHY [0000:00:00.3:07] driver [RTL8211F Gigabit Ethernet] (irq=POLL)
> [    4.443689] sja1105 spi2.0 sw0p1 (uninitialized): PHY [0000:00:00.3:00] driver [Microsemi GE VSC8502 SyncE] (irq=POLL)
> [    4.575718] sja1105 spi2.0 sw0p2 (uninitialized): PHY [0000:00:00.3:01] driver [Microsemi GE VSC8502 SyncE] (irq=POLL)
> [    4.588012] Unable to handle kernel paging request at virtual address ffff8000801ac000
> [    4.595960] Mem abort info:
> [    4.598757]   ESR = 0x0000000096000007
> [    4.602515]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    4.607843]   SET = 0, FnV = 0
> [    4.610902]   EA = 0, S1PTW = 0
> [    4.614048]   FSC = 0x07: level 3 translation fault
> [    4.618939] Data abort info:
> [    4.621822]   ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
> [    4.627323]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    4.632388]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    4.637714] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000082b7a000
> [    4.644437] [ffff8000801ac000] pgd=0000000000000000, p4d=1000002080020403, pud=1000002080021403, pmd=1000002080022403, pte=0000000000000000
> [    4.657016] Internal error: Oops: 0000000096000007 [#1]  SMP
> [    4.662693] Modules linked in:
> [    4.665756] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.16.0-rc3+ #30 PREEMPT
> [    4.673615] Hardware name: random LS1028A board
> [    4.679116] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    4.686103] pc : dspi_8on32_host_to_dev+0x8/0x24
> [    4.690742] lr : dspi_fifo_write+0x178/0x1cc
> [    4.695025] sp : ffff800080003eb0
> [    4.698346] x29: ffff800080003ec0 x28: ffffc25414698b00 x27: ffffc2541464c170
> [    4.705512] x26: 0000000000000001 x25: ffffc25414b06000 x24: 0000000111705fd3
> [    4.712677] x23: ffffc25414257bae x22: ffff8000801ab5e8 x21: 00000000fffffd98
> [    4.719842] x20: 0000000000000000 x19: ffff00200039a480 x18: 0000000000000006
> [    4.727007] x17: ffff3dcc6b076000 x16: ffff800080000000 x15: 0000000078b30c40
> [    4.734171] x14: 0000000000000000 x13: 0000000000000048 x12: 0000000000000128
> [    4.741335] x11: 0000000000000001 x10: 0000000000000000 x9 : 0000000100010001
> [    4.748500] x8 : ffff8000801ac000 x7 : 0000000000000000 x6 : 0000000000000000
> [    4.755664] x5 : 0000000000000000 x4 : ffffc25411a308d0 x3 : 0000000000000000
> [    4.762828] x2 : 0000000000000000 x1 : ffff800080003eb4 x0 : ffff00200039a480
> [    4.769992] Call trace:
> [    4.772441]  dspi_8on32_host_to_dev+0x8/0x24 (P)
> [    4.777074]  dspi_interrupt+0x6c/0xf0
> [    4.780747]  __handle_irq_event_percpu+0x8c/0x160
> [    4.785470]  handle_irq_event+0x48/0xa0
> [    4.789319]  handle_fasteoi_irq+0xf4/0x208
> [    4.793428]  generic_handle_domain_irq+0x40/0x64
> [    4.798060]  gic_handle_irq+0x4c/0x110
> [    4.801820]  call_on_irq_stack+0x24/0x30
> [    4.805757]  el1_interrupt+0x74/0xc0
> [    4.809346]  el1h_64_irq_handler+0x18/0x24
> [    4.813457]  el1h_64_irq+0x6c/0x70
> [    4.816867]  arch_local_irq_enable+0x8/0xc (P)
> [    4.821330]  cpuidle_enter+0x38/0x50
> [    4.824914]  do_idle+0x1c4/0x250
> [    4.828152]  cpu_startup_entry+0x34/0x38
> [    4.832087]  kernel_init+0x0/0x1a0
> [    4.835500]  start_kernel+0x2ec/0x398
> [    4.839175]  __primary_switched+0x88/0x90
> [    4.843200] Code: f9003008 d65f03c0 d503245f f9402c08 (b9400108)
> [    4.849313] ---[ end trace 0000000000000000 ]---
> [    4.853943] Kernel panic - not syncing: Oops: Fatal exception in interrupt
> [    4.860840] SMP: stopping secondary CPUs
> [    4.864788] Kernel Offset: 0x425391a00000 from 0xffff800080000000
> [    4.870900] PHYS_OFFSET: 0xfff1000080000000
> [    4.875093] CPU features: 0x1000,000804b0,02000801,0400421b
> [    4.880683] Memory Limit: none
> [    4.883750] ---[ end Kernel panic - not syncing: Oops: Fatal exception in interrupt ]---
> 
> I still intend to do more testing, so please don't send the next version
> just yet. Tracking down this issue took a bit more than I was planning.

Hi Vladimir,

Just wanted to check if you are ok for me to send a new version with 
your fixes included now?

I assume from the other discussion that we don't want to always enable 
DMA mode either, and we'll just leave it for s32g target mode only?

Thanks
James

