Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE841C9DD9
	for <imx@lists.linux.dev>; Wed,  7 Aug 2024 09:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723024177; cv=none; b=gw5qSdQTWhBjGt+e9DcL7pv5KA2NERFIFo+kzv4gx8yKb9LkX3um4KNxX3H7bOKjHfY+hIZ97KhjbYTaccrXx7bY927kn5p9lj5QcpjYDR3sjVFJAwmgepbLmG+8+VZ2LngLw+AyXlz2Nw25uXNk5XKEwLlum7zs1ad/FXayINQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723024177; c=relaxed/simple;
	bh=p8oOle8j0YyFB8aei5q+8ZxQH0nnNcOH9u81uVEH3kQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tAPiqN2pwadE3qF+Y/VD5t0BfH2bEa/ApJk53meEcugurcVlXjaxk4IygOrFTK+W220OLkObDLh9pmqD8/6CLwJZwLeXIugJ0HyJUQOJjVjZSSgXqlln2NVU49JryTZTZg3StwZ/Yj03Z63W9Gj+Xd1XKmQIhH46V+unvviii+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HsJ8c/6z; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsJ8c/6z"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42808071810so10739225e9.1
        for <imx@lists.linux.dev>; Wed, 07 Aug 2024 02:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723024174; x=1723628974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pc/1iktJr3p9PLDHAKJFkcEhANCClecq2itvdxpvggU=;
        b=HsJ8c/6zkE7cB0n/F3JPCV2cKXOg3fok5ibbvSBcP7JwKw4OKQwf0g9RUTzzRvqCBU
         0GhM0O7LDBc3V5r5oS8OhuMSR6jgjGFLWAyExGy2yc75zYefMLd97Mb1RTlawtzPcwCk
         uDmEzj/K+bxMbZfkFu+2ef8EFwjuBe9LF2Fx2rG2726zPD7VHic6muUFkgoB6qxRMhJ6
         JDOhUmxsgHq1tJbQmU6ourS0QjYD27cLNHveC0f3uxUtfcr8Y8zmgbSPBucV5Muax7oh
         nVz+d8jCmWIVRIIhnrAzs/L6BtT/0at/8vNfdHbWSoQVcMJflGn8++MSoo0Y0RsS8oN1
         o+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723024174; x=1723628974;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pc/1iktJr3p9PLDHAKJFkcEhANCClecq2itvdxpvggU=;
        b=vE1c/VeWY6NWHITFcah924p+BziLa3GcRcEpcj01oUcpxzXculMEHqsSBVUkJZVoTd
         p7UiX+8H73rHbxHO9QflxDnBZLHpQ9vwIeJvhXmjhLPAguFG+Zq19Sm6oA2whXN2L0xr
         Whc+jMJnuzUF4+JfLOkz72tvKTouENWk7UhfbDbrDZbpT2WIgeuUmCv149U9y3N2t4yL
         jKB8wjo8/0qtA1TX6dtlRXOa8nyWELJexZVGlrOJJeJRe58UaVShqG0TJdLjzij2fNdQ
         qIlQmQZKsIU6JyrdAPxI1DiB+JloGrTaG0NS9zjTDwNq6PeZkfCdYoXu6JxRh1rQEYIt
         4q8g==
X-Forwarded-Encrypted: i=1; AJvYcCWFVFLP55F/YcvJb9JMY3wtaqMflYITxMXAbtFh6TxNSOU2myKlROk2t+XU25AV8H0qqV1JjlWb8M3S6v1IZxml6Uzt
X-Gm-Message-State: AOJu0Yx6mUbFz0/B+PU5X3TSkzbon2Kr5trgnLHhKnlsbMTGF7h7eSb/
	pbbx5SBBLRlzWy2EIYENtvJpeqNye7QTN938HgnJf+fMWOSsfkDGdwrkuBsKvmE=
X-Google-Smtp-Source: AGHT+IG7C+gyfAmIU5emdVImNYDBwmPpefND5NNGBZ5h26Nijfjr5hlnMITUlNJ6c7ynyH03xWfJyA==
X-Received: by 2002:a5d:4ac7:0:b0:367:9237:611d with SMTP id ffacd0b85a97d-36bbc17bfebmr11861794f8f.60.1723024174050;
        Wed, 07 Aug 2024 02:49:34 -0700 (PDT)
Received: from [192.168.68.116] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd05982bsm15530967f8f.86.2024.08.07.02.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:49:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20240228081355.1627744-1-peng.fan@oss.nxp.com>
References: <20240228081355.1627744-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: imx-ocotp: support i.MX95
Message-Id: <172302417240.381927.16775224846160228092.b4-ty@linaro.org>
Date: Wed, 07 Aug 2024 10:49:32 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Wed, 28 Feb 2024 16:13:54 +0800, Peng Fan (OSS) wrote:
> Add i.MX95 ocotp compatible string
> 
> 

Applied, thanks!

[1/2] dt-bindings: nvmem: imx-ocotp: support i.MX95
      commit: 62e39987d3d5f27e2c074398805d101d7b9abaf4
[2/2] nvmem: imx-ocotp-ele: support i.MX95
      commit: 04d372dd5562ed8aed4cdbb1004fe33a3bc4fa24

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

