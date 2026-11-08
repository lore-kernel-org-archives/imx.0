Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.32.148.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117270;
	b=bbm7smuKBeqp46tTRYcE1g+RGu5XYCegFnOfMgknWuf0GnHk1VlDgPcMqmnvyoT1lLsQ
	 90I34P1a3z2ckvFPmKjEWEv0Ihv1JsLaoV+GrQi2w7iBhRKtuCJeN1w3jNlXXvyLHP3WI
	 y0lv9m3AC/zM58R//KzuEhYKlONnxR1bnDHoGLYkH8rBuSIOSItgS3TolCbMYZGnX+3Ip
	 OAjYB0j2kz0gY6xHEZiugpg4BJoQtmV8Htue5yheOXsTmuQdFscZcqFT0wv+GLg6PiukT
	 DZyQEM5fqtFXHLp++n59dcpmZGwF6XsyrqLsR2FPL6GerRAnZZ10zzGMXuVl/yFROPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117270;
	h=DMARC-Filter:DKIM-Signature:X-sib-id:Message-Id:Feedback-ID:From:
	 X-Mailin-EID:Date:Cc:Origin-messageId:List-Unsubscribe-Post:
	 List-Unsubscribe:X-CSA-Complaints:To:Subject:
	 Content-Transfer-Encoding:In-Reply-To:Mime-Version:X-Mailer;
	bh=68qAN3cxENFwAIBUF/JxoATn8PZjXEsg2lXjyDXyT2c=;
	b=m0vWZxx4DUwIq1GvC2hRmnzBWyNOIYwgD2i8gh9XtEE3ypyw9PCifWcyN8xEeYmuxdS0
	 cxjwx6TqQxT1HfDpIdY5zr/q/Z14RDHwT0oQUbQB8A2z4BbbeQnF0EHAxWiwR6HIv59Rw
	 Qiv4P6xmvJbA0HZJRFXIZsCaOU3Wr81w0gxnZiDuBlETL3it97NShRirkFtFdU2VDurJ8
	 CoLdpKwfpYxH+JBvdWFGbL8i8fNpmDWQtMVzQe4CDRIWUxRYEMf6RqzQYBcq0LfU4/ZPe
	 MiUa+7y93Cpb9yseZyAhRAzTiUL/frFR9S1IZLXr2KD/GjbzHl1YUzpE1ZOYZNfMiKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tubot.lat;
	spf=pass smtp.mailfrom=gy.d.sender-sib.com;
	dkim=pass header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=FT0wYlGB;
	arc=none smtp.remote-ip=77.32.148.25
Received: from gy.d.sender-sib.com (gy.d.sender-sib.com [77.32.148.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C87606D807
	for <imx@lists.linux.dev>; Sun,  8 Nov 2026 05:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C87606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tubot.lat
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gy.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=FT0wYlGB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tubot.lat;
 q=dns/txt; s=brevo1; bh=68qAN3cxENFwAIBUF/JxoATn8PZjXEsg2lXjyDXyT2c=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:in-reply-to:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=FT0wYlGB4GaVEhqwtvJZv9uTPleLAp4A+W7cIIKdO8utk0hEsYPtKdUlTdIBBlt5l/VOyebHN2ti
        mSQdbCyjhvICrUnxRNdzmeTHpKE4TPNP2pLmwS8RrhmCx1lflc9i2f3Fji3JSfYpw2TJ4aMPtF2k
        s9bkRcHD9kP8/V9utX1OhmUR8NdSpJL/wjD2AawseKlyAQEQYVOe6f8d9A5Eg7PO2pYgYWfH2oo3
        K7VSnX3Yl1dARptTPlmDnvh2cUylloH/Xu3CZtm2Icqp8z0xMdaOjZ8hpoTwhCWv2oEWbAietvn9
        +hkltey+GaAWWn8r2ofe5frLHAyswGmxAVKbqA==
X-sib-id: 11mRzEaehwg17yoSZ-6v9VYsGJI1VMiV9t8H-sOz2Vm8cAt20UKB94Ecyx6Z23MyMGPHf_1plp14rp_kmVcenR3-ZpsMMiERg26gz_vKQf6Q2ISizUN1sqRAIMGYUh5YaObKBWPcozQJQrlz-OUpexOwltks-PHlMJiqUW_AT5tNOA
Message-Id: <20261108055421.301762-1-DelaySystem@tubot.lat>
Feedback-ID: 77.32.148.25:11287567_-1:11287567:Sendinblue
From: "DelaySystem" <DelaySystem@tubot.lat>
X-Mailin-EID: NDczOTMwODc4fmlteEBsaXN0cy5saW51eC5kZXZ%2BPDIwMjYxMTA4MDU1NDIxLjMwMTc2Mi0xLURlbGF5U3lzdGVtQHR1Ym90LmxhdD5%2BZ3kuZC5zZW5kZXItc2liLmNvbQ%3D%3D
Date: Sat,  7 Nov 2026 21:54:21 -0800
Cc: "DelaySystem" <delaysystem@tubot.lat>,  <linux-kernel@vger.kernel.org>,  <gregkh@linuxfoundation.org>,  <vickramk.207@gmail.com>,  <linux-staging@lists.linux.dev>,  <linux-media@vger.kernel.org>,  <mchehab@kernel.org>,  <imx@lists.linux.dev>,  <p.zabel@pengutronix.de>
Origin-messageId: <20261108055421.301762-1-DelaySystem@tubot.lat>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-CSA-Complaints: csa-complaints@eco.de
To: <slongerbeam@gmail.com>
Subject: Re: [PATCH] staging: media: imx: ic-prp: add FORMAT_TRY frame interval support
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261107-batch1-m1-prp-try-v1-1-56a08f54791b@tubot.lat>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1


Please disregard this patch.

It was sent from my relay by accident: it copies a patch I did not
write, review, or authorize, so my Signed-off-by on it is not valid,
and I have no connection to the listed author, so I cannot vouch for
this submission in any form.

Apologies for the noise. If the actual author wishes to pursue this,
it should come from them.

DelaySystem

