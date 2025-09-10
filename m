Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E9226F280
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 21:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757541377; cv=none; b=EQgnJeSMWsDT3sIv26zO+IpqVVSzk82IJgOAQrjKysxNiIumxHCI3SgS+BGzM/F56720mWzfaC6Gq1m1YNn88QLUHaK1GLCF0WzDXphuonO8hXuirNkDym3kOv2bEl9HzaOjiOU+0a2/cm5ZAPIrgY1EILu6Qhj7gjUI/4r7kVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757541377; c=relaxed/simple;
	bh=1K0L7vy0m6oAWABtFjIMxHjGZLkeAdVFiL8lxzfzoUc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=B4NoZ0TyNiqvK/X4TtAHKgJL/yr9CrufJ/FpMTRu3CeIa54moSE4LxO+2rTMc4y+AUklb1QpwSKSR+atdSwTH0iK7EmnAz2nRdaKEBBs5V32kS8I1k3Hq+ePGmImUgtdcGXsCPZseFDid7b1gwhB86wTAZho8/0orga5fFU5sTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGowG+0T; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGowG+0T"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad4f0so77130a12.0
        for <imx@lists.linux.dev>; Wed, 10 Sep 2025 14:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757541373; x=1758146173; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9d1QV8DriomeYuygow3J7NXcF+FjsYxyafVX+X7WJo=;
        b=nGowG+0TP1fhosC9BbQRGv+OTHVeFI5pbfXwPxSpgEP+biP1PNOGwjdKhtB9mmd4Ka
         Medkft0ViFinNat6YPCUKnj75uTChaPuA1hDsgf9uZLx357WxjnVle3d4yNE7g+/jMpz
         jZizePBb8Ot6/5plN+N/nIa2l36w4qWjWRfrI44XP4nq6t/13/SLLGvleK/pFswLy0eK
         FjAjbgXegXnoxQhOeYe7gJJQwefDV9wuUquL5UD9IKwSJZu8iw0gJiUjv05zCubiVRFo
         hnZG1MyaSu5JeKoJUYa7FOKHQZzCaoxtR+ZCnAvNuaaZ8W+OkBx91O+UaZHs+I9whrB7
         YnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757541373; x=1758146173;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9d1QV8DriomeYuygow3J7NXcF+FjsYxyafVX+X7WJo=;
        b=ltoy83yGaD0DrPGOs9WQWayxljbtbV+yvVLGD5y18e3bUqf7B6kw+6HiHF5VN7F7yk
         BAH0wYr5zW92VW91Q4oJ7KUW4893Pko/Z6h9Ng7Yfn0ZE7ZvG/upHd9uMO+ctX84avt3
         m7dnrq+3uI7yUBEsmu1fsc3xf7ELQMfCAXxvmcQ2b7jpn0DsXHqKuYvDdKDrk83aCN+C
         cLIaG/F9qboXBT1bY0TDZn565eEG4Uq6f1aMOSC3fGq2qsBxr3G7A3BobpHa8j6Q0zwP
         nWmwp8EffeLjyGlALZJL5Z5A9FJHwtsdkbXk33H2TX1D2GaVG/CWhoh17hNclxMl/Lsk
         9k8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfDa2L/Gco5oUMm6S1sbRVWITOacTOhe+gPeh7IoqMeOlKd1rs7E5t6s38L9qKTP48GoQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCJ72uk9REgxifx78lIMATN6LFqAgvtjEXFcCWMiDltFOHeIAi
	+CPfOC0NT1BAEOYT0HTuF9aNPASnjF50RtyoqYa1LBUgEVkboARVmSfN
X-Gm-Gg: ASbGncuL9Kx+bng/bEz1SCzp4Cig0Lllbenxb4eLiPshAhix3BPksZDq8UmGUWem/st
	dy+t3cNMTiL6qyJxxrB8yHzVOAVMPyhSGJGreNKLxnAe1f4yjQgpmbJ3bCF6KtDDsePv3QCSp9z
	/wuHoP9s5CalPBjkK1lbZTI6ibRvb0L0/smY4MlGWjMNKKX5R3cpwJKxQLgR6i/GHV0KGwoT19P
	HM9hWQaWJrsBJlekEw0lAAKCzcuPgtG6HZg6Atp894ybQ6af6Z5JhSJE9MoktZrp5ynJLYW+KqE
	LBrDy7DhTt2ftum+LxDlgzFTuipbv1qVotve6U3nED6BFq0i/QNvfxuHsURmSH4LKvB3uj8XfX4
	XFYoiay0cgL9R4BrmvG9GrZFgmT2Zq3AuXvyBaaTxwBMdPiLBmsSfmZaAPzOPusfr6JYrgatbYL
	NeZHb2Jpk=
X-Google-Smtp-Source: AGHT+IGBsR+U1n4WFqO8g+vB4ERFu4ybrDNCTovC+1KY6W1/R7uSZEcXa89aKrlY6FwBWGiHJP9Ndw==
X-Received: by 2002:a05:6402:50d2:b0:629:c417:ee5c with SMTP id 4fb4d7f45d1cf-629c417f146mr10662130a12.32.1757541373118;
        Wed, 10 Sep 2025 14:56:13 -0700 (PDT)
Received: from [192.168.0.51] (217-62-96-139.cable.dynamic.v4.ziggo.nl. [217.62.96.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ebfe0ac03sm69476a12.16.2025.09.10.14.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 14:56:12 -0700 (PDT)
Message-ID: <1206e86e-488c-4c58-9e67-2313a678a5a0@gmail.com>
Date: Wed, 10 Sep 2025 23:56:11 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: richard@nod.at
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 alexander.sverdlin@gmail.com, andreas@gaisler.com, ankur.a.arora@oracle.com,
 arnd@arndb.de, chester.a.unal@arinc9.com, christophe.leroy@csgroup.eu,
 dave@sr71.net, david@redhat.com, geert+renesas@glider.be, heiko@sntech.de,
 imx@lists.linux.dev, ira.weiny@intel.com, ksummit@lists.linux.dev,
 l.stach@pengutronix.de, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, lorenzo.stoakes@oracle.com, nm@ti.com,
 rppt@kernel.org, sergio.paracuellos@gmail.com, surenb@google.com,
 vbabka@suse.cz, willy@infradead.org
References: <640041197.22387.1757536385810.JavaMail.zimbra@nod.at>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Language: en-US
From: =?UTF-8?Q?Ren=C3=A9_Herman?= <rene.herman@gmail.com>
In-Reply-To: <640041197.22387.1757536385810.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> In the past I saw that programs such as the Java Runtime (JRE) ran
> into address space limitations due to a 2G/2G split on embedded
> systems. Reverting to a 3G/1G split fixed the problems.
Believe you guys are talking specifically ARM so FWIW, but I remember 
for x86 that at least initially Wine and things such as VMware were 
affected by the more creative PAGE_OFFSET choices.

Both will have been as a matter of plain bugs and are supposedly long 
fixed (and I in fact believe I recall such fixing for VMware). Never had 
or as far as I recall heard of other issues back then.

Rene.
