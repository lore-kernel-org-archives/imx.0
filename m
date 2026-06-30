Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD40271443
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 06:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782802203; cv=none; b=QUeo6PmR4EVWqkhXgUccUXwL/nSTMkHAxLimRGK1peA6ShpYmPSQypJbKOUvOfBq/26n/Y+QM/zoqhIuGCtQyb8PinOsEgBi0u3W9BcDUOZKhCufgCD2F1VGqIv3R3Y9dm3nHyc0ekQTOqAhmp/QBlMgcU2al8KjPDRVgbOeuac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782802203; c=relaxed/simple;
	bh=czfdUOiQXPZbFnAATDYk5b4JmkpWW4Ig3zzIBmSKRSc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Aa8vFBDhAznXGE8G3CjB7C9xZ43GDYY3MjpTqrGLCM0uPAkH7cxPTrFWm3BI1+g60JluLlou1uVCp2cap8gyeCM0VDMgbTCv9EbEX+Ba2Rgh3PkouB+hBHgIG3f2zzAjI8b/96EA9J1AikRDvMkK+mz4bZ8zRohX6fC5itKeBlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuFvtGgS; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuFvtGgS"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c7cfa17fedso33938885ad.3
        for <imx@lists.linux.dev>; Mon, 29 Jun 2026 23:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782802202; x=1783407002; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1QY57v2o170i5Uh1BA42HSzcmZFQxfvkMqvmdq9s28=;
        b=HuFvtGgS3hGxfBAr4qaWD4uZ7OUwePu9cuQ/LgcBRgcXyEt/jLeFIsSpv5hwpl/g8U
         AS1B2O2UcWePM0ByrWe5ljOVbREsj6zNl49ixqro0p8CV5TumZjgq6smbdcL7HjLIoXw
         ZzGgrDomH9kO7rYnAt3ApeEGbPGRrdS16iu7tadkmgRqYKEWR04CtL4BGehGvdaSwlbW
         IRaxcJh3+gurugn7NM6EEqBAuDxTfsmQ7SGp3kqkNQyWwdgIUPsAyHyCB6yXQNnv6Z1n
         0h1XTrKNEJoVvGm/dabEkfI7zNFQOmwAfp9xmFqTRJLOVLfWfmO/p1FvRFVnSz5bLJC8
         emtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782802202; x=1783407002;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1QY57v2o170i5Uh1BA42HSzcmZFQxfvkMqvmdq9s28=;
        b=f7ZIaJR0gQ6rE7pPhtxqv7eHe1mt3T9bXgizdKF+HyIx7sdRUdFCzvlBB441UKV1RL
         EGmAYreZTimFL7DaVNhvaKYIzNh7eE1yxfDP3rrvgi7WMa0VjCPWrHrwpO34IkxmoRKd
         VON4N12G9cyREhKdclr7qekEbDNmG4ZFVKfQ2sDJYVEbNTmTHCbVE1d1CI/DTRDyO71A
         a/9lx8LGna7c5FTW3XkjjKL5Up/uknmmQDdun54D21B4ko2Zj/GJnJA2V2Jjg2bDZ8ix
         8qC1Lr1wgLByaisDdkQSfux19mKbY4LHr02n3MOcuHlSJXIUt8/a4KGtDD7L1ZwIn+cr
         j++w==
X-Forwarded-Encrypted: i=1; AHgh+Ro3J3Ckeyp2qQV5rtlmI3HFVOSFvaw5/OKNo7a9yxTrYRdVindQYynZO8sKnaqsqThaGzQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzstve/3LSV0tR/aEZq7xnzxwR2Jh/J66SIKv+Rw1yNSmYqFM+4
	XlckaX40F9KTzdVKc4xpraY1IIxwOvcPBPr9wp7xTKGqR8tE79cbY6SB
X-Gm-Gg: AfdE7ck1CVvDgN1Abe6UOC0n4FI6xSLlSq/eYVLqYVY2mCiBIdBZgnbF86/CekWatgD
	4QmHvDbWum2hOXlnoWBZgU1cKsBrXrvNORByq/w5vN++LOInl/LC7V8gDAsaPzVNL6ikrcSLE6j
	AkJPpJ8f9kJt7piIW6QpkkPS4T67cGL0kZUdJQaqoP9KiIlqA9fM1fpbM3P1OmfWYlJ9F1Nz7lh
	IazhKoLGJVjJBUeTTHaSkM9rRW+ztuIFFQjDSSJ57sUZd91PtTa1ejN00KRSxCdH/Cs+jqDHpX+
	A5rfbEeZDU6YDWjgeJEtz+dipmpjyzJGIX1tZ2s7tvcdkQvKzRERxRa6WP9MsKcVY3NkuG5SlLW
	AxxXZm5xT0C6XZgZD5OM4bIW0YmHrHtaHSS32Aoogvl8NbGHAL+D2dZ57pp1y29Bv+Mytjma2U0
	BOUq29qsHmzlotQg==
X-Received: by 2002:a17:902:f786:b0:2ca:6a1:1fc with SMTP id d9443c01a7336-2ca2d99a4afmr18114325ad.28.1782802201660;
        Mon, 29 Jun 2026 23:50:01 -0700 (PDT)
Received: from [10.31.13.168] ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a701f9sm7373285ad.13.2026.06.29.23.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 23:50:01 -0700 (PDT)
Message-ID: <1a07fbf9-d21b-45d5-87b7-d9965e73c6a9@gmail.com>
Date: Tue, 30 Jun 2026 14:49:51 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: frank.li@oss.nxp.com
Cc: andi.shyti@kernel.org, biwen.li@nxp.com, carlos.song@oss.nxp.com,
 festevam@gmail.com, frank.li@nxp.com, imx@lists.linux.dev,
 kernel@pengutronix.de, liem16213@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 s.hauer@pengutronix.de, stable@vger.kernel.org, wsa@kernel.org
References: <akJ9pd8uhXA6y2s9@SMW015318>
Subject: Re: [PATCH v4 1/2] i2c: imx: Fix slave registration race and error
 handling
Content-Language: en-US
From: liem <liem16213@gmail.com>
In-Reply-To: <akJ9pd8uhXA6y2s9@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,Frank Li!

I apologize for this. I didn't know that different versions required 
different threads. I did use `--in-reply-to` in the patch email. Do I 
need to resubmit the patch?

Regards,
Liem


