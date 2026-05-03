Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F784175A66
	for <imx@lists.linux.dev>; Sun,  3 May 2026 19:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777837810; cv=none; b=Ky7yYmA/gOpXOvCExZ9SwnMQda+hOBqG3Q7e58YH2fssrCGL1xDtSEfW1zYPlBfihB4wLiA9tykXyPF/8J8kii+w5AeydlLCDd78f7hpsi+jdafz2KbpXcy3uRg0DJDOgvXx166lmVrdxUW1ysghXXQRCNrCQYV/ChvdtLR0tW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777837810; c=relaxed/simple;
	bh=uthZmONBUuk+WMGtj597kAOFGLE8xMCSEXcpDcg2u6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cn6DCDgNeFwI75H9p+26bjFMgBfQUu3wXvdEe+irTs1dHi/1CReEofki+wCXhVSZWhMk5xDBdAtRAwpY+Vtgk74H0g+jCmFx/Uub6dIQy5iR2CF22tFKNOCVnxuLBh6DenBGdcD/Zpc1vwYOfHqeichyQDfccA6m5oBIKdun1Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQ3qZDbo; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQ3qZDbo"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba0fc8b1f0so3085275ad.3
        for <imx@lists.linux.dev>; Sun, 03 May 2026 12:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777837808; x=1778442608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uthZmONBUuk+WMGtj597kAOFGLE8xMCSEXcpDcg2u6c=;
        b=XQ3qZDbo3TfG7HI+fw1fafaj9PPWMRUZWnWAjcioZ5p7WcsoCvOSRBR2p0ArNtBPm1
         F1v47i+PSdQDkynCDyWOMTLCI4HSjg3wVBpSsg56L0IkdIjnQ+kcW7kb4qWrq2uAjDHg
         l65cWRDQujQszaRg02P9A2LsyLzsFe2YLASUNOG3iVZtBvcFGnSdeo6EpUgvnA78MrS6
         2r7Vdz0G48vlygPoun7klOsfyqaHDq1rkSAror0+CP3WJ8O0x6OnVE26CraLQIkIGgV6
         HZJpjx/BC91TfEtVpShpKJ7tcWKyr5lK4RJsN1pQLoc1JBntqFdxhNrtVdUyCgCEOYz4
         rJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777837808; x=1778442608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uthZmONBUuk+WMGtj597kAOFGLE8xMCSEXcpDcg2u6c=;
        b=YvWQKmJW2Vbbf0d5a2eVxFlkoPaWQSd7osLltoZ95EJdcld4N862pfVJjJXx4hImUY
         E+J7MoeS566KJzczX9H38XjTbTgY2ot7n1jNrChngCElvHbtyHpejCVq87KduBgvBYwy
         XXdn7tj8t2cp1VEdQM9lQhXAqj9DShM7bc7JvHDharFBdwjS548J0xbB+wvoMLMpPw4D
         1yb4+7OWQAZ828WYrsFI+lSlznBeGVOGWERhUTnBrsB+B0v5CTAOuWtuVAEes9udRPY9
         Rvfr3+ZZaiBYCKPWUjci7Z0NoSBRzx51RnXDcGUCkPJ0dS2unXTBDkALkTWXQQvyaP5l
         q9vQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dW1iiXjjf2f8NMPU6QDu3h8ErbDYU2/M/4CrrsQsvZ7IHmgF4b+l6/2bnTaXByareWww=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdaAv/8jU1epxFZ5gT8icFzkZForJtnohlHu3y1Tx+O6Cq54j1
	XQ3lCtkokOtSJPcREVWDCadiL0dAx+vnwtpuUwQC7Dh83Tt98kHrI0dZ
X-Gm-Gg: AeBDievxvIDEjSc5QKhWC9EAJZzLkXgc/IPixwkM3lwX+ENK63ZcP45BJR7WFzE1JnI
	buFOFmPuezjTnnePuWdZbquubbLcfyLEB64aAmLRNYNi3kAnn/5JYPg8axJSvgTa8/q1FwD+1UR
	QJweqoMp6ttq82QIhqr+UFO44PwGsYacVbok7gF7LTG7kNuE4MwMFOlpnsFjYAe22+52h0hJKP2
	8/HJ7VnN0r/NvGmvruTr5pqxPSeh4u8QzPis18BdTsZS0ZWEoFqZgjgLSDC/QTegzOiCggHg6yc
	apew6NSrqF+D9v36rGj7UcTCATlUqKLm4jKf/pp/dAU1yV4IDGE9VzTPpIlhr0KrmER2CA6FyeK
	J6Kdq1mLxKTK3iH2dqYKfNkhym+Iav82sacORbMuxXDzwUiGm8C8yBZpFvtDUUB2WSincVokgCp
	Z8BRxHzYB3RiVaeWK4OQDmQuvCifc9iHdFsIWSZdD3gSDBH8un8/bpYLZUhP4kZDcvGj6dcUODE
	T8bd0oRzAs=
X-Received: by 2002:a17:903:944:b0:2b7:9d86:ad3c with SMTP id d9443c01a7336-2b9f25e222amr62851315ad.23.1777837808409;
        Sun, 03 May 2026 12:50:08 -0700 (PDT)
Received: from localhost.localdomain ([115.110.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae0d97esm80224185ad.48.2026.05.03.12.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 12:50:07 -0700 (PDT)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
X-Google-Original-From: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Subject: Re: [PATCH] serial: fsl_lpuart: fix rx buffer and DMA map leaks in start_rx_dma
Date: Mon,  4 May 2026 01:19:21 +0530
Message-Id: <20260503194921.3449864-1-shitalkumar.gandhi@cambiumnetworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260420135903.2062024-1-shitalkumar.gandhi@cambiumnetworks.com>
References: <20260420135903.2062024-1-shitalkumar.gandhi@cambiumnetworks.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Any update on this? It has Frank's Reviewed-by but I don't see
it queued in tty-next or tty-testing yet.

Thanks,
Shital
