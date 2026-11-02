Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610516;
	b=Vi2AToIRsZP+nCbWsMxSAOA3aJ0NbVdxucDKGMJO3II6gbONwO/gDysU6h77cH7eQiyy
	 nDKmsz3W0wYPmlIQfsJVLIt3VFV1/uUapQr/QRzbHiNd/0CKIUdzZOfc6fNJley+2U0TT
	 1E7s6jZrVVBm17ToMep/nFKSf/4SA1OMPM7FbzakpAsqbAy4SeSPmVvQZwTX9mOIl+13a
	 B3HwPdo1YvKk7yqjaeITck6MOupi7hWjAnD9Eb06ebiYFzn6MJjT7uQtyvDyqnbtKJYut
	 twGl9x1j16V8zsHZwC2Ys9bkpCWM8qdPvk6NXM3OEBsk2OCFCdd3gHLso3QRip6xmCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:Content-Type:MIME-Version:Content-Transfer-Encoding:
	 From:To:Cc:Subject:In-Reply-To:References;
	bh=x1SHAzLThNu9oZCbybnTos4ugmhRzcLaJuKRLYuRdxA=;
	b=SSZRpqGcFe/YmiO58lcOYFFL8QFgUNGRANIwUdhAmVG/oY4Wbu6zJl3QiakdglrlLgRq
	 c16L++hA7hUxnCHc3f8W42zNnL1HIwcIBwCCOiwgqo/P3Rt1ZIDSr8Oiz/q49cKWtwCmL
	 +9G29OBDEfoDIOIoo8gvU34ukCictLnGoNOFGidvK2fIlZcgt2L/Mq4B5sC4NtDki0hgj
	 7bN6m36iHzSoqk4QAoFPYZ6UFoCWYsFmedHMTvSCPpzPVbMPwz2B0/4pwOzd3SzvBv8As
	 CydjNncIW6x12PgrJDoYkWzINloACO/O+CTiXCK7w3O+inybbmpcuQpEHSML44fCSvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PBjufrAv;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229D6606A326
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 09:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 229D6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PBjufrAv
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b1ce85287aso648849c88.0
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 01:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610515; x=1794215315; darn=lists.linux.dev;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x1SHAzLThNu9oZCbybnTos4ugmhRzcLaJuKRLYuRdxA=;
        b=PBjufrAvoQVlXi45tvNWeAZPLq+yoZvPDA2XDdU2CSwQIrZowvKY4nxCFz+0a1MRd2
         2mGh29qliv9fUE5s8nPwF1oU2gkoipkdWUskQRodSOtEF/h+xoQK7wZW6+ftZMlLIdjA
         IL1sG5dfu3O/gpFSRY6sqYq3/E7ixO1HCetc6+1Sra0jbLu0rnU628+5xARZReq66y0P
         8ytiE/kXDwqBcG0osoZ1ZosKKcPjwqJUqM+TSKLGjFO4u5f5Ordsz0i9zoqKi1o16Ioj
         lNpyky1HEmZihJSUnaTE58b8SVpJh18c9P2Htl6sQL15y3wsTsUOVzOB/12y4TVfhnbu
         nAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610515; x=1794215315;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1SHAzLThNu9oZCbybnTos4ugmhRzcLaJuKRLYuRdxA=;
        b=NAC0dthfmXgC6QBDeYJv0MK1NNgKbYBRM8PuP51IUGjD1AdDzdnDiYGAs9oaX4HeeP
         WH70yEW9ZtH1nmllSq2l66L1ldr1Waqa7fo6QZH2FAsoDN+U67bTNnTidHLdCKQh2TR6
         WaTE0znEu74nhX+driBqXf1e5AgWt9uISWdumrCLW3y/H6H/Gmb8lSZPkxdk2F7Wa2tn
         hBcwfKHjr47azFAveg1RnAxUBLabr7oFYz0O8z86MJmzYiMmwGNA7X7PVabvji/f3skh
         nSX/PC9LOQhpckjOVS+NcfMF5nP4VtEXOlGRz7uKvEjEhWLTgorkJIsdBLjhnJ3P6/t9
         xo8g==
X-Forwarded-Encrypted: i=1; AKwUvBzMD+ET27JZJUJea49O+U8UVOjsHOhxd1NEEaxHWZNRyOuy/rSowM5a9vH4OghV8xuYy5o=@lists.linux.dev
X-Gm-Message-State: AFq9FYKEDaicXpUMtw7KTdLVeadU07Zxai3tOYyaG4tRLCMAjlEzjKhI
	qvslVgwR/rDeshU3Y8s3HoBvP/3W0lIDyL+FkuGvqtCFP0m+xRh5ks9/
X-Gm-Gg: AYBFou1mMCLPVrYSiMKxYzWq8Ox2LVmwwfwzC92Y8Bvh1jVReR4BIJZpm4KbRDNhP1A
	0RzeWwgBZ1cz8yOWohj9p8ySak47AQHl7FOIRAUorF26geWj+roDfc0k1C1KwVRMhwcqCI7dodB
	DujrW/ZusnI8/uCI/+Jk/tLSHAFHVCahmrQp7Tc5YzLTVA3lDlsl1SwQcTqqgW2wcz2efIwXVvJ
	z3AmebrlUSq2HunplvFeD7rEk3ZzZZlqeP14Sx87yBQkiJj7KjE4rOdms0RU49/62RoJtvBU6Ed
	q3GF/P6GpKKs6KO8S0BJUnlB5iLXPET9f3BrO0XKCXm0c+ebb8cDVD+/6Wg1ihLuxEFd2sH5+DK
	99ukn1RimDoX2mDuvUZAPcuabAf+YvK/pVZi6sLArtb1RHfljB4TEB5R6LRauxKWnIxb+UoROmG
	LLFxruykQI59/VP+hkMZClsEtPxdKt4qGsmU/VRkCONfhIuLKgrAYATlPz8QdoOOjtjXPJO2i8f
	VXgf+6E6QNKzRbv4pX0VUdIotOL/AW1QPAslfQRCmG7tqks4KGfb8PvEFBE2YxPwjSq7Qxj1k0g
	kbRWZdNY9xKHhmo=
X-Received: by 2002:a05:7022:ef07:b0:188:ea93:6cf9 with SMTP id a92af1059eb24-1ac5eea1fe9mr17349633c88.43.1793610515172;
        Mon, 02 Nov 2026 01:08:35 -0800 (PST)
Received: from [127.0.1.1] ([115.110.137.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm15375863c88.9.2026.11.02.01.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:08:34 -0800 (PST)
Message-ID: <6ae85312.ccc6ed06.132fa6.3d61@mx.google.com>
Date: Mon, 02 Nov 2026 01:08:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: bratiranjan11@gmail.com
To: Frank.li@oss.nxp.com
Cc: aisheng.dong@nxp.com, peng.fan@nxp.com, pankaj.gupta@nxp.com, ping.bai@nxp.com, imx@lists.linux.dev
Subject: Re: [PATCH v2] soc: imx: imx93_lpm: return -EPROBE_DEFER when SE firmware not ready
In-Reply-To: <6a97fdc4.d9789fc0.362adc.c4f2@mx.google.com>
References: <6a97fdc4.d9789fc0.362adc.c4f2@mx.google.com>

SGkgRnJhbmssCgpUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LCBhcG9sb2dpZXMgZm9yIHRo
ZSBkZWxheWVkIHJlc3BvbnNlLgoKSSBjaGVja2VkIHRoZSB1cHN0cmVhbSB0cmVlICh0b3J2YWxk
cy9saW51eCBtYXN0ZXIpLiBUaGUgZmlsZQpkcml2ZXJzL3NvYy9pbXgvaW14OTNfbHBtLmMgaXMg
bm90IHByZXNlbnQgaW4gbWFpbmxpbmUgeWV0IC0tCm9ubHkgaW14OTMtc3JjLmMsIHNvYy1pbXgu
Yywgc29jLWlteDhtLmMgYW5kIHNvYy1pbXg5LmMgZXhpc3QKdW5kZXIgZHJpdmVycy9zb2MvaW14
LyBpbiBMaW51cydzIHRyZWUuCgpBcmUgeW91IHJlZmVycmluZyB0byB0aGUgTlhQIHN0YWdpbmcv
YXJtLXNvYyB0cmVlPyBJZiB0aGUgZmlsZSBpcwpvbiBpdHMgd2F5IHVwc3RyZWFtLCBJIGFtIGhh
cHB5IHRvIHJlLXNwaW4gdGhlIHBhdGNoIGFnYWluc3QgdGhhdAp0cmVlIG9uY2UgaXQgbGFuZHMs
IG9yIHN1Ym1pdCBpdCBzZXBhcmF0ZWx5IHVwc3RyZWFtIGlmIHRoYXQgaXMKcHJlZmVycmVkLgoK
VGhhbmtzLApCcmF0aXJhbmphbg==
