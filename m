Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3A531B131
	for <imx@lists.linux.dev>; Sat, 16 May 2026 09:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778922463; cv=none; b=UJ5wYH1YVNgDTddsGLmM3whtWbYjIO4wLEfFogzZrHSZW2Dfmlg8F9gCjMUcj+vP1jwmUaNIe+65NQkdd1jbOrvM5vlTB0kpUvlx86uS8fCSGDqKW65xBmraP5sFg2nhupMn4d/SboXWe0zbs8BSGBpUc1lhfJjtO1C8bNmyspw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778922463; c=relaxed/simple;
	bh=ndYhF2CWwUwE5KJwraXl/Izca/Zs7isR1/9AJ49V6Ds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A3wI/XI9SQ2F3jBOdV83Ps+vsfR5WHgrR0wFmrC4DHqx95TcRSruikfS495tWWbZVSk9685zLR+oLhPtEhIRAM5fZPGO6yEyQttraKprf0uLooRDZ6mTDyKO42+axuEdMlJtpgvRWrLFBquJhz49el4cxVzQWxM0VcdAwaakT3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nrj+mAW9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nrj+mAW9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ac04e13dso597955e9.1
        for <imx@lists.linux.dev>; Sat, 16 May 2026 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778922460; x=1779527260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9iwndGPdhhfbaDqoUlTzWSRTEYwd9nb6CJHJivhXZA=;
        b=Nrj+mAW9X3n7NPZrrlvvcRGYETNodi18oAVVgLwc7z83YsG9Yo/pgUukuf+xlgKoTC
         eQUrO762ppO15u5Fzh3valBDj4O7/iOt4QdA5w6ayL5HZC0Xxjk6O607LIXQHtqnTzh/
         YE+u1llHws12TYQL8vfPTs8kxTk5vs0XM1TlhzXfsun1H5Rmu2EJy4sbCHJhGZ0MJafo
         fM1tWJFwSlqhJo6gk2aMOVWY4MmJM79ihw4nNQB+Er3H74Vuw/+6i05SOjjlbwVYWOh2
         3dB2Zw342s8A8kVbdZi8bZCN9gTBmzF0Ci3kkd8rkGdRFiVvAQKyCnRyEq2igFwxOGdF
         TFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778922460; x=1779527260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9iwndGPdhhfbaDqoUlTzWSRTEYwd9nb6CJHJivhXZA=;
        b=sC4iVeP/aR8FE2mNlN7Szsxz46AecfRUw6IcUe96kYlaog+kFOChd5/2Z2JvkPp+iP
         A6bSo0VnRajc+aORGByLiwq40cb9Eh+QyvyDyC8RJ6gS94TfazeEjheJu/NgdQpUFaCi
         TkKDSMSXt0FFAX9njMryncwzKGSeFUWEyRO6gVeJFQh1UsoB6YMV+qk912AuAh/UBySg
         F8UmfSuE/vqsF+SnThpcZLCWGUDTFR409XY7kUp/8NUBeGz0yevENcKwfb6xp4daWvkr
         B4BUUSlbgF6g8cWhmsjWaL7ATClD9FNOWczYmW9TKYbVMaqMtZorIKyKNydG4JiT/wnQ
         9wdw==
X-Forwarded-Encrypted: i=1; AFNElJ/0vMonxsiKjRugia45f+bkZMcLPBuxZsAy0kF3XvweLiMJqelqtMSnDPkYAeiwmQMSyLg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5OxuUVsIh/4JddNKmW7wATVsyL3GJZjjS1yl4Kzz5tK6qbqtS
	ZA5USUw9CaiH3jZMGg/yCCAFRBbDmwjsBEKm0L27AbBYY01sK5BVIO4R
X-Gm-Gg: Acq92OEWQCDbcAvrObPDlJJnt3X3rIQTVzh/0XpoxjTJQptDv5JCSEmzp5dhZPIv3wF
	RFhRIor4A9zUaH22Sqw5ac0456JjF5OYTaH+GBJOEE/J8HEn4prVsUdhx4xehBzsXF4sB54oe4I
	j8H54fxcO+psxzWDJcKKeTKJlcRyhpy/7gSKUXEEFoyS5bJKXr77k4J/RH3BtpwFkQXIMTc4xdP
	KOHGTBsdY5Pkg0H3wk+TH04RHr6mq5nP98xUEfl7snVJcy+/n2jumZrrZJCj2eT287dtM2Btm8L
	Uo8F/bDUBLsyHRQaToNH6SHckAOEG2aaUunZCT1LTho301LbR+8ry73Kp+URBoXGa/thItcOx31
	IIHArftkKeM854990Sj0JdqthC8NIsE04vTZzf5l5fEf4SloTrrVXt9bukf+Aq3Tiv1Qm9ralJm
	bGDV6/zO9sypphpUQuOOn9XCzyPGCX4c5HODUQ/zVFeJvH
X-Received: by 2002:a05:600c:4704:b0:489:1ca4:c999 with SMTP id 5b1f17b1804b1-48fe66550aamr47129795e9.8.1778922459852;
        Sat, 16 May 2026 02:07:39 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe66544sm32827265e9.23.2026.05.16.02.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 02:07:39 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	hcazarim@yahoo.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: Re: [PATCH] firmware: imx: scu-irq: accumulate wakeup sources via sysfs_emit_at()
Date: Sat, 16 May 2026 14:07:26 +0500
Message-Id: <20260516090726.38362-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <2026051633-doorstep-sequence-6782@gregkh>
References: <2026051633-doorstep-sequence-6782@gregkh>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, May 16, 2026 at 09:15:54AM +0200, Greg Kroah-Hartman wrote:
> This is a horrible sysfs file, and breaks all the rules.  Why not just
> delete it and use the proper api for it instead?

Yeah, fair. The sprintf change just papers over the real issue, which
is the interface itself.

Quick check: no Documentation/ABI/ entry, github code search returns
nothing outside the kernel tree itself
(https://github.com/search?q=scu_wakeup_irqs&type=code), and
codesearch.debian.net also shows zero hits. So removing the attribute
looks doable.

Frank, Sascha -- any out-of-tree readers of
/sys/firmware/scu_wakeup_irqs/wakeup_src I should worry about?  If
not, I'll send v2 that drops the attribute and logs the wakeup source
via dev_info() instead.

Stepan
