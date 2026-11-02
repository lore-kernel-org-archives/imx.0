Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609440;
	b=JezcWtcGP1ogzOTPn0jTHRo7LhGTU4csz523gZxfTzdEAP+pM2Oai8Q2N71doYCZ8QHL
	 as1nePMxoGgFX7W2ZA/xJn0/U3FJl58UNx1uok+ILB8EeeeoPUzFLU00k49tnfQpIDKsq
	 u/qKAaC0Q3KvNiN0HwA+S8Ig8N7vK7GxDW6UTerREVsnmvoUn2ywgRGoqy0ZCJddN5wBX
	 /r4cAmgdAvutanidSuTIv3PhADDd4Yni39DQLfu1XK4c/YenEZyUby2LtTL+0QdqUBRq2
	 y3bdr70DayLsNIyxtVnljjLu/gDWnGRXUMV/ZfuUWP6j9L8V6XuGc1MTbYig+sNoDzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References;
	bh=HOz0nfYFS7wmwjXnhUPqLpjRfsjgrFCeRXa9QV9ck4M=;
	b=4ErLs9+ZZ3Tn9Ei6a8ZycQz123e8VDf9ftVTsGdynGi9GP45IVVN3TEXxIxTFBxv0LAp
	 I8H3FoAjSrNhlNcJF7Tqrl+5aF45E2LH1FfwVaHMxDJENS1OFV8RJ/cRe65LiinyCGaAJ
	 5pHqivVvvIk547kuDyFvTdC+qHKXKCiYAsMGr2L7N6IJk/O+t4fEjkgia8S1CSwtu3OmV
	 +EXQeViCrmNCQDf+AY8XgTC/Nc8Gw+6oQ4x43i+q11WAu1fb/BF0RPSTV3sJg6E+6w1sw
	 sYLrIPdS+bJTxVqx7nkuUBZ8Ab8ThuXxlHxeXwTewkv/K90XoiP7xq/9wZjAeQa3anQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bgw95OVB;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95078606A32D
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 08:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95078606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bgw95OVB
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2761c69fbso4044399c88.0
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 00:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793609439; x=1794214239; darn=lists.linux.dev;
        h=references:in-reply-to:subject:cc:to:from:mime-version:content-type
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HOz0nfYFS7wmwjXnhUPqLpjRfsjgrFCeRXa9QV9ck4M=;
        b=Bgw95OVBFoILytD2zpBfaI5Zxv0P2vy6ieLNY6uM8OmbS5I5b9kVYdnXnWqArTphcb
         Q013H9oSAmkCDXa0qBO01Dxflk7aHzRDisXbgIqwe6WPmBteOw21MZ64cyzPznNCtapN
         +CDPZdHD80WDKFpzdz0r+i4qTBk80Y9qOXONru/ApWVxCz0Z3Pxn1lslFtD8fjqOqhql
         ZcSgfX0kPMGU6wYjbuETfypBN1Mizs6/1dbZ5tTz8LUUGUBpik/aEXVSRkTerdOcT4rg
         jNEMlmyALg+tm7xuILoek8Ke9j9ffpkp5id6xKC2d8bAszbE9tuI53j0N8B8KuPNzD5H
         crww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609439; x=1794214239;
        h=references:in-reply-to:subject:cc:to:from:mime-version:content-type
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HOz0nfYFS7wmwjXnhUPqLpjRfsjgrFCeRXa9QV9ck4M=;
        b=FASOwoiPbKBsmmvjf/Qe6raC9P2+KLjuo8n+ykZq1bvSBWjVBfrjsGg00lgC88SIba
         onXg1E1A2jv5XoznsBOwkVUOzNOtghxAURvAcsEAyr+klYuP9nC+FZKeZf0A3HOOcSA/
         29LCNk4IWs4PJ/RRiWFOvud2NxUPnszKwA9icWGlDiI5OtE7PoOtE2r4L0sVyX6WBzNI
         ZgmxVQPw+wFI7Q5/tKBd6NcV5PiSYG1hO7vEYW44iR5J8k4JHGhJTu26uBQTTUIgP2Ap
         8oh16CONuBx0OQFdFfdpNHf2CgLdotnWlVC0+acnga/+CtOv8b0BbNuSLtU/Oro9R7DP
         IFVw==
X-Forwarded-Encrypted: i=1; AKwUvBzTd2qXo9tuzxMblwnZsgZSSOQCgAl1NIjotEOZnz//Ut1LoqovByZkfiTKH9jD6CLIyhE=@lists.linux.dev
X-Gm-Message-State: AFq9FYKT0LfPije+mK47JWifPQOSWIkTWyptpuZ9DkgUwgi3ra5GMAij
	IS2dqU9jFCKgmtUYgkKQGeXLHLjCVaV3ztyuSy3+d67SwwR6wxYPzftN
X-Gm-Gg: AYBFou2xAhr9J36io7/bBch1qgCUvNKZP+wCJMS1ep1vSXdoetQ2v9rIojs3fWopesF
	SgegBnflx23/AWgJy2xaBaUkJjFWXj1p93T14JpmsPRdm3fqc2wDp1Q0L3TNzuAb1mlDURnd+Ar
	Z8MEqsEhahS4bvfedMW694gh7EymRmEfanbOAOQMK+KwOEs/bXUhDr70EqHEu4QP5MShZrh82VT
	UGm2h8awRQ9x82msSeCTmWyQQqtMS2yRLoBmCUuKcINHb5vxYgqfP1haWgo+g6PAo2zSTW3S2vM
	M5ftqzLWKfvDE+HzFTvWahf+0+PlbPzytAlMMe0e4KVU2sB/sLAzaMLzEgORctcLr+tN+PqxUxT
	RXiZY2HnGfoRN9TZwvapK8Kbq9zmPca/xwBHOFwsKAABhy/uvN8Vm/fzU6mXbUz1PFayJ3bP8aJ
	BjTU4z75iQfnWye6nooIll7CcA7OnpRZUBZDwmuWJ3c29QZhHYAyqk0dMEMeDSrcVhDwaEevw0E
	vTfJBGRhVnfgZCFucPOi3nWIW4VjhYyfzmaKBTEBi7sv1LMix1Fef/FXMSK6ozrA6XJFSMmG/Du
	b2UuHKU38vmnYxo=
X-Received: by 2002:a05:7022:1113:b0:1ac:9da7:e86e with SMTP id a92af1059eb24-1ac9dc67128mr13365279c88.30.1793609438528;
        Mon, 02 Nov 2026 00:50:38 -0800 (PST)
Received: from [127.0.1.1] ([115.110.137.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm31178450c88.20.2026.11.02.00.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:50:37 -0800 (PST)
Message-ID: <6ae84edd.4ecefe71.11f9f9.3a0a@mx.google.com>
Date: Mon, 02 Nov 2026 00:50:37 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============4214120530499220928=="
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: bratiranjan11@gmail.com
To: aisheng.dong@nxp.com
Cc: peng.fan@nxp.com, imx@lists.linux.dev
Subject: Re: [PATCH v2] soc: imx: imx93_lpm: return -EPROBE_DEFER when SE firmware not ready
In-Reply-To: <6a97fdc4.d9789fc0.362adc.c4f2@mx.google.com>
References: <6a97fdc4.d9789fc0.362adc.c4f2@mx.google.com>

--===============4214120530499220928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hi Aisheng,

Gentle ping on this patch. It has a Reviewed-by from Peng Fan.
Is there anything blocking it, or anything more needed from my side?

Thanks,
Bratiranjan

--===============4214120530499220928==--
