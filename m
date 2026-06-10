Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56043BA222
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 09:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082645; cv=none; b=g5GelL9my3YAqEGKeT7pSBzbn8VBPuW53oGUEKgZkkcQ1qk1UwslntDn0+Uecmzv9BaRtQQUmvmvw15oSmy/7hy+8+8YWKhSdvHR9sz0nlMdKPxVqRBUd5MEXV6YpHblOf0tM5W1ymzMTRkWE2jbq9rJ2bB9AonV0l3HAnAwUl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082645; c=relaxed/simple;
	bh=1u/gyIAUL1eHXRk5cCApALdPFJbXqUR8YqK8IXcgoeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pm/2Pi+eDEqnCzSSxNzvoT+0aDZ5RXlePfTecJ8qOmIlMSlqEDgQ1KFJXCEwvzfgUaZD2qsSr8dJiqTXWDQZAVSa7wfdWrPw+q05egVMirdCpQoS8aoUZ3whEmZuA56AT+3dh2UKzX0MrctGXEkicoHMqXArTEZHUmbwfxnc7Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6eTo4EA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6eTo4EA"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b915ded5so56167985e9.3
        for <imx@lists.linux.dev>; Wed, 10 Jun 2026 02:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781082642; x=1781687442; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MVCneA61j9/Mv1FcSX1dBIQFass/grRjgoNTeP0soOo=;
        b=k6eTo4EASlcXq6S+9tFdWo+Rv0cKERJJrq1T9fgZtqfzD8yomB/dkPWXy49zLJphn5
         2XUX9NScRwo729N3KUJnOo/6mBr/3S26Bv5IfHGWGvSnvoesUTlLfgaLh7Kw63NS150A
         1jhAi1duMakoR7b8BQE4Cut80rIPjDcve4W4+UvWLL8q9B6c2PLZbhx7AzLqiDXr/GYJ
         uNd+mmO5RMlRIbiQtLj5mglgQPUyvMGfNhd370HzYYqmjJR2i8HbjQ6F5AgJqe4aySnt
         g5WtEpZawsG4BanmZweINJciG9slPGB/5cr3eRDHK99V2iRStxF11nfBmnDHh+gWwBfD
         G7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082642; x=1781687442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVCneA61j9/Mv1FcSX1dBIQFass/grRjgoNTeP0soOo=;
        b=gxNfVxwFzMyg2r3ft9N8QLnbcwC3i/2kFM0riTNKSdTo/rhORqt30buY4+NMseT2Sz
         MSTxniwoDKgZUxizQENdphTFPGezy1YqrB33rsLL0otCvIIHbEtzjTvay0V97O2zYkq1
         HQahQ4MZfDkMs03xHH0K4PvP+z0aaG7sAE0kUm9O7uMRXIEtti5/+YhJpOgmGaLXHvJD
         GP+f9/PFGkXzEOx8r2FtczbjTpBBmZPMH5TJWwH0HV23W60MZ/X9F4EEMJRo3zn6JqDJ
         E5yu8dSWIbnWvWRRkOXnFuU7+D8Asf3tiQXqiQsvfQsIUgNunK1s9sEwY2fOspp/XOKL
         8LUg==
X-Forwarded-Encrypted: i=1; AFNElJ/c3bKDdAlrQeGNSUsFN0SbtvOgS+7jA/+wjimxSzDvLnYMlQsUDSZADJMOLVMuPrzOgV8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEXFyQV7qJ/v8U2jfxwN0JOSvw1a+tv7pE22g7gNispC1vFVc9
	ludm6/A1QI6J+keirnUfIhuOlybdKAFsUN3BYJh/QHsXKRESO8DkSg0C
X-Gm-Gg: Acq92OHNgqwHmwFGbM5ZHl1aXtcnfmPvnCcGonuKdpxTaW3PqQAyvZH7LLbtbxvr4L5
	9yNNn1QfH7BBQB5u069aENoRn0TkkYv69/pSPJx/WHiR+1vaD4FmSQOyQYSnPNmVZjRPXeE7V0C
	bYS41zblTNHQIWBMNmt8ZEemCW5nTWSDX6fwGkNdt4zm6Kxdi1ivjLbPL6+wI4doJTIR8XdB6Wk
	zd012otFPKIhpimI7XI1IqURFkxlRpa9e5YB2bbKEcNKq7iENjVFfD45gwtnhfWbuTBFC+x0S8i
	7njFYwnvs+6mSwgEEfq6KQd07qwIXi5r/9vChAjtpMwYJ/vS/f1rkr0e4IaVAIuKvEL3/g8E00f
	JOGpXNspgfOFUp9d6dl6Ql+nYPCGQM9TqLNcMjWyu0Fd1hGErHBpZWBWeZm0WZDL5svRIOwQFZ9
	mqnoIf5O13dw1jN18dOaI5ej3yFBndlMKujBgaKKNhynl6lMVTGulLLP0A5WOhjuXSpSo=
X-Received: by 2002:a05:600c:8518:b0:490:a298:3859 with SMTP id 5b1f17b1804b1-490c4993bdbmr423122135e9.24.1781082641859;
        Wed, 10 Jun 2026 02:10:41 -0700 (PDT)
Received: from [10.25.222.173] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm579850645e9.1.2026.06.10.02.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 02:10:41 -0700 (PDT)
Message-ID: <2fc48536-5af9-419e-b4df-746b678cb6ab@gmail.com>
Date: Wed, 10 Jun 2026 02:10:37 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Francesco Dolcini <francesco@dolcini.it>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
 <20260610-adventurous-granite-marmoset-e0eaa8@quoll>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260610-adventurous-granite-marmoset-e0eaa8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/10/2026 12:37 AM, Krzysztof Kozlowski wrote:
> On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The names of the carveout regions are derived using the names of the
>> reserved memory devicetree nodes, which are referenced using the
>> "memory-region" property. This adds a restriction on the names of said
>> devicetree nodes, often bearing specific names such as: "vdevbuffer",
>> "vdev0vring0", "rsc-table", etc... This goes against the devicetree
>> specification's recommendation, which states that the devicetree node
>> names should be generic.
> 
> No, it does not. Names like rsc-table feels exactly like DT spec is
> asking - for a name matching purpose. Are you sure you read the spec?

Quoting from the spec:

"The name of a node should be somewhat generic, reflecting the function of the
device and not its precise programming model"

and looking at the examples provided in "2.2.2 Generic Names Recommendation",
wouldn't "memory" be a more appropriate choice for the DT node name instead of
"rsc-table" since it's more generic, while still matching the purpose
of the device? Or perhaps I'm interpreting this the wrong way?

> 
>>
>> Fix this by documenting an additional, optional property:
>> "memory-region-names". This way, the carveout names can use the values
>> passed via "memory-region-names", while keeping the devicetree node
>> names of the reserved memory regions generic.
> 
> I don't see how anything here is fixed. memory-region-names has nothing
> to do with node names.

The idea here is that the names of the carveout regions can now be passed
via the "memory-region-names" property. Previously, we were using the DT
node names for that.

Thus, we can now use the more generic "memory" name for the DT nodes since we
no longer use them for the carveout names.

> 
> Best regards,
> Krzysztof

