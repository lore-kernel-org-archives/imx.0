Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D1C182A6C
	for <imx@lists.linux.dev>; Wed, 17 Jul 2024 17:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721238604; cv=none; b=KzIalPW1SmwVSKVPvz8vC702A4ae96NSNh5Dg4V97SZr0NYrJIxOyTwO29z8e/2s+6qT6jFUevi+s4OsAUUXYh0JpaHPTBijiJG3B3X1cFthy5zv8epJD3An3uQUIx5Iqo0AQkjEJpWYxWCA1YCwS4l5izrzKtaokC3ndDvQmLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721238604; c=relaxed/simple;
	bh=bloGZeSyi/BjK2fTP+teodHTpU0UW42MPHzRk885YhA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ii2wAy/RfC3qUZdtsIR/Jxha+mdnJFNGzqCg5dMuhkxzuyo5jzusfuIAKoe7hHHSuBjC/Cz3+nSeoAdmJ+/Jp1FFSi7BS5kjaRG7r9xi6BNUfgYp9gLQ/F33gun4fHqoirJknhg9/C4ksXunx6wPncYFMcuqL2lbHnO+9GfQU8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=AV1MGQAV; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="AV1MGQAV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1721238586; x=1721843386; i=wahrenst@gmx.net;
	bh=bloGZeSyi/BjK2fTP+teodHTpU0UW42MPHzRk885YhA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AV1MGQAVSxB1NwOQnynsXJ5TKvSXFioU4z/Q1wqom9k0nLOnfMI36RGzVLGNwYJz
	 9N8lmiC1rIgPPDSUhJ/iU6NyL1Y7QKWSSQ2hjv28/wSt0HnJnDM+OdfFghejlRFh2
	 kNoy0C6rWB8rBLQiNdwOgdH+lIPF4FxSQIMYjRO92/nksvkcR86tgBncDp3EVc7LT
	 2HbtaqefALZZr8NKgfBSWj0Rb/DhVApkpXie4QJSqKs8im2ZgIqtT/InU2kHdeAJH
	 kt67hLclvW0MumZcqUM2OalggbdWtSH+I4JC1Y2hRMMD9XXL7EAMqgGNLuLlMXF43
	 opbwAZLnpWd33OiIJw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7iCg-1sHkgl434E-00vbSC; Wed, 17
 Jul 2024 19:49:46 +0200
Message-ID: <bffb5d44-4eca-49cb-8624-e7bcce525fbb@gmx.net>
Date: Wed, 17 Jul 2024 19:49:45 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
From: Stefan Wahren <wahrenst@gmx.net>
Subject: mx93: No cache hierachy definitions for ARM cores
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZqFNJuzCp12lIBnEqMXEIjrVDNt1dI1ggHsTtxpA6ZlSpFdcAzA
 oz86owB3wspAWiusXoJU+smDZrWq7pCeByux6ZPmD9aUwzHJMOJzRSH5+FhvNxa3HDASktd
 +7kZeJatofyHxfSg4CdomUSf8EBE3QXiO27OmcUvAhf9MYU6+JLANLzCMBNB7DduSjLddLM
 HL9uWKXzG3wfvRN9jIpOQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rMcG9beqokI=;y4AuKR5GfIwp3xFrsyP0vQpQceJ
 rxXNuL1LOyfNT3zDxK0BjubpBxbxbxoqjWTV9J2nDulsghLpSeuG5VYzQ98Il7W4Usnh7Ak27
 Q1wcW8ExgW9ayeST5QULTRM2Fc+tW9Sy/BhIzvPrv17iGis4ymN2rhBgPBaJdHZuW4/JsrjY9
 K3xOscq3vcl7Brrz4a7n9jnwQPn6x+VmT0g9YKhym2Ias6bAbdPoBr4MfZw1qd9Zj0k6NrzHk
 Hv++a4dApuj52Ts6dcutz/hgRcMoT1O6Vh/1kNY6A7ecWtLj1nZDZTigga0O18X1FgmvHLcqj
 Fuf+bx+v7xoNKJOtNpEUy7UmzIlsULtyHin92oGrYp++xhoxH4GSZy/VOf+HYNOH2lxQFeFT+
 TyYX0vu/sz+8zWriuZUoTOukvGKcrqYgkt5VW53KIhaqhjHtHKmdTrBUYqY5vH7WqQfSD6siP
 3VmG4NJ6uXXzW22UFHD8fbvQnHCD49SkaWKwx2s5Ye2WdTUZ9nPgYVCB4MUiwisc6cUgQ5Bmu
 dkvXt1Hstcy3B1iKSlNl+rGR3UPHr1/zmhV+qdt5sMY/GcjpUvseOv1RXyNEuDntHebJYPZch
 2Xfjoq5cttCIuByI08blKXVapO9RcFPGfdawnd7mcBRw+8oXPtKjNYF567ewlTIWddQ2eQ++9
 NH/MPTdtCzlsGdfr6yD7bT3ajyIBySnEXxUw5YmxuxNkuMh5J9iUlP4wC6kD6854L9eV4WZLL
 MFykdMor434+WVVGez4Rv1aFQtzFLfpJ1SUUqkRqxU21QIP51SOeMVWJAQkhfJNnnPDlE2RkG
 43wBY5Em8kXuHAZ/3ZEDKQ2A==

Hi,
today i noticed that imx93.dtsi lacks the cache definitions for the
Cortex-A55 cores:

cacheinfo: Unable to detect cache hierarchy for CPU 0

Maybe someone with more insight can add this to the imx93.dtsi file.

Best regards
