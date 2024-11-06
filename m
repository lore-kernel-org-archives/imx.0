Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBFD1D359E
	for <imx@lists.linux.dev>; Wed,  6 Nov 2024 09:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730886208; cv=pass; b=AeN2V0IXky++jZVcp0Wa2RnWGabpi4CbhQHbgwpqWj69nNxftWPjuEjj3S5h78JheMd/kSlDh7BOF1sB9LgUdAYq5KOz7iHy6eYgLQ1do6mE/zdLbFBJ38lg8uqa0yeQxZ2q2QFUClPgvcOWfuh/kgiQnbjQbSPuFF/VuFxFhT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730886208; c=relaxed/simple;
	bh=u2jso3BoE1iVGK+i8zsaacSXmeFJ9VXoh6m+++g4Vxs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=K0yi5bzoptK6Czky72wV0ADpUltrWey+alA4OV9FLTk8QFo/GA6jPlrboFglvWiCOYFaUQLqkVB0k8I+DD68X0yptz3ukxDrta9rGYO7k93+7Wb18DN5/ZkvDXtJDkiMyt1gD+k1r9qW0vsUE/1FbLULZYsht8DV0GuhnlhKkro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=dJJ1Xp6t; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="dJJ1Xp6t"
ARC-Seal: i=1; a=rsa-sha256; t=1730886205; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Cf0amWWIstvFR5QgZScGuFWSe/ptlLRmdNgB0XRtJ5Ld0F5cb0s5WDBEc1E/ddl0qRKID9o1cjzllsML2ukNFI2qBbl+EvaXx+9KaHcRG1PLIdpKLRlMTobXzdqgZ5uorTJLdG7BrTAtWbxeRoGu/Nr7IQL/vWtZTmzKDTc3APE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730886205; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=19QztSNR39Yv8poxA+mfIzYPMb9oWEv+tHdPnrrM4pM=; 
	b=QsFmLpCBZ+fXU3SwIe4DymZPOpmmFevvc6cys5DX92jCJkzRfmdhhFBn21gHz967IpDKexylrzrzi9Wg2b129wCWDesA37bRLn/3AqODgExC6320832SeyarJ0uuyrFuQMB+DZgkJBAbNFk4FcX9sK1L7QTJdGiI6H0mLWuaxhY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730886205;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:From:From:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=19QztSNR39Yv8poxA+mfIzYPMb9oWEv+tHdPnrrM4pM=;
	b=dJJ1Xp6tPrD0aW1Sfldn8aFMJueS3VBTcEhlG/QPeKwKshxQRYrKnVcKRa7SpAb8
	DUnr3Hp+zFibfeSPwCIif/mMgjSZChb3jW58V19BYaxrRbW3vrsyilmIVjRcGuxBNG8
	u5KyxAJ8VMwFpifQFhuMiHjLPVr4W7XH3KlPHbNU=
Received: by mx.zohomail.com with SMTPS id 1730886202930134.79232865862105;
	Wed, 6 Nov 2024 01:43:22 -0800 (PST)
Message-ID: <83aac8b2-f80a-46b5-93fc-3369b30cbfc7@collabora.com>
Date: Wed, 6 Nov 2024 10:43:19 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: IMX8MQ EVK board not booting anymore with v6.12-rc
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I notice that my IMX8MQ evk board doesn't boot with the latest v6.12-rc*.
After bisect I found the suspect commit:
   commit b8979c6b4d0d1b36e94f5bc483fd86e38107e554
   Merge: 7b17f5ebd5fc b62800736f61
   Author: Linus Torvalds <torvalds@linux-foundation.org>
   Date:   Tue Sep 17 10:48:09 2024 +0200

       Merge tag 'soc-drivers-6.12' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc

I haven't been able to identify why the kernel isn't booting anymore.
I have udpated u-boot (v2024.10) and firmware-imx (8.25-27879f8) on my board.
When using the commit before or the tag 'soc-drivers-6.12' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
the kernel boot.

I use the following command to cross-compile the kernel
ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make defconfig
ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make

Have you been able to boot IMX8MQ evk board with a kernel version since v6.12-rc* ?
I don't have any log since kernel just don't start.

Regards,
Benjamin

