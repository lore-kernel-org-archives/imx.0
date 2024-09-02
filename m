Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0DA1714DD
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 13:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725283591; cv=none; b=ja9wIiucBJj/J70RiefceNhUqm2O6FdIh2Gg+uUQvj5iiT3aTTq1mUX5qBBKkItQwqQaOxx30m9ZFTZXbdcwXa75nlfd3euHl2j7acSdhv84fmuRLpXy1aQIQsx3+z7W7AZfIxgaqfVQ1FHs7tE0B6KcedZJWEa20cp/3OBh1zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725283591; c=relaxed/simple;
	bh=tdAxk7fpD0jtrHX4ghnakK3f7Dx8Y0RnwL1ShMGYpec=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a2hl0ioUYJGYUsXmDw4SLD/rTZF8rGkFsFjHaKWnWLtxk0ulno850g5Xxvo249k8+jg/0WGJCfvMX+TxCbX4NYKbmZ7ICAmbgrR+TTGPbQIvik4/doIG0Z706zUx/eisI96IP/RnaUV68lni3cNOCGCLosyg3GpJgEUFWBLE0iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e/YY9m2V; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/YY9m2V"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7a843bef98so426984866b.2
        for <imx@lists.linux.dev>; Mon, 02 Sep 2024 06:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725283588; x=1725888388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ll17WnEq2QD1v4kzvbpjRXliFn5RtBtmZ4P8lOA7hyE=;
        b=e/YY9m2VYNmOVOTjj2lfJD52ImOlginLrVJS9yUVYo1NFgEFz35MRcx3X3QcUb/09S
         e4vhs3chQJKKYmBTga4kOYp5w8ldkF1oP506q+xXTCK4Kvui7m+Bq/KL7McyaOZ4c4IN
         se5wS4hYaMR5UNCDCyw3I6fE0b0QVyqYZlqUQHW3WDFdvNlW7V8aPoZnkXdjmPd2wnYI
         0G1b4pAeHxssxII+bXkmhChXPTVD5G9PgTDos+QuZgMO7Yp87NQPmQrsDyOmJ4zd+yHu
         A7aCRGxXpD4HFWFTx2WNQudGxuLY+b2hYt5JFmctBjSn6EZEXZ1ZBzyuPj3o7vwWGvYY
         ZzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725283588; x=1725888388;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ll17WnEq2QD1v4kzvbpjRXliFn5RtBtmZ4P8lOA7hyE=;
        b=fCWPTL9Zdg10s4GkhDbfdhYt3CV/pYwip42MdXFryTsQuQPawa5EPCi9QbyZLAQGMz
         ZePtsBaOuWX+B5AYrwIdwE0w2dvSnyJ4rqMo7QH+LJfj5ABVLOutUMOxBojiXtDX/NiX
         yqy9w2RvGZfeCs0eIhdf1Zw72hrGBh6ncI4KBpxRzgzANoWn8zBG5GpiBO4CM2cd+GnJ
         /UyztYgjSuSwgZCNr5C8uxRDlNRo4azaCoI06J5P4gjvDau+OyEr55oGNwLG+inI43hl
         S87uS+InEVFX0CQHKUtlQUx7GvY4VAJk1FV6IMUklMDeWsocLJ6DDwYS6vZqRfRZDAJc
         rIYA==
X-Gm-Message-State: AOJu0YzbYL6T8L4cmfPBGqjYBikJ3JsNlCRrUSjcKn/TGHRZK9S8YO/9
	3HumKdFRDymJ3wDxxSFZN1cssLkNb1FaMl/huyIJSy0trXkceJI31KsD0xCgc2o=
X-Google-Smtp-Source: AGHT+IFUW2mrfci/YBXvvFfNGauk7QgRCbm/4yOkk5/74QQP3pIjCOiFOKRkNbdfo/C0jQM2jKH/gg==
X-Received: by 2002:a17:907:1c9d:b0:a77:c9cc:f96f with SMTP id a640c23a62f3a-a89d87243fdmr484488266b.7.1725283587638;
        Mon, 02 Sep 2024 06:26:27 -0700 (PDT)
Received: from [192.168.68.116] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d8345sm566658566b.173.2024.09.02.06.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 06:26:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Walle <michael@walle.cc>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20240821195419.581889-1-Frank.Li@nxp.com>
References: <20240821195419.581889-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: nvmem: sfp: add ref to
 nvmem-deprecated-cells.yaml
Message-Id: <172528358655.66088.6710003370220252451.b4-ty@linaro.org>
Date: Mon, 02 Sep 2024 14:26:26 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Wed, 21 Aug 2024 15:54:19 -0400, Frank Li wrote:
> Add ref nvmem-deprecated-cells.yaml to support old style binding.
> 
> Fix below CHECK_DTBS warning.
> efuse@1e80000: Unevaluated properties are not allowed ('unique-id@1c' was unexpected)
> 
> 

Applied, thanks!

[1/1] dt-bindings: nvmem: sfp: add ref to nvmem-deprecated-cells.yaml
      commit: f0202d0eaa04a74b1cced013394cb346e9900a00

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

