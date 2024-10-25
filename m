Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5521885B7
	for <imx@lists.linux.dev>; Fri, 25 Oct 2024 16:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729874560; cv=none; b=RY6QdkmFzFRGe7V/idIt+CZx6lAoXltJMlbyP3NB0vytyFmHoJVBcTSGH7fMdCgopVmHxeTF/6Yc0NqOhkp2N0rasPey3MOp+Fo33TMWdvmoh5JpJOpMn7gwIAu98uYJFkv7SdSswu36xkvEpo2F1V1pyZP6+uTCQJzDtJd2VRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729874560; c=relaxed/simple;
	bh=w0JT1TqESpVV9gsS7lH9mOWo3pQnOkcgm2i/+kqVMjk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uXvZmsKfQZ8sc0YSG8pQzLbCL8XYTupWQNg3E9TftoR0Zfleqc73dtQUpqbAhiktZ/gkrrrdo4169whezZD40MyPxtz4FTTrw9xX4URs1iPdjKxqs8/V4ChQJBypu3wZBJhD/v3VONuNI69ulQRNSiIYTAcdWsubiQe/VjqYqLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QaBuost4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QaBuost4"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d3ecad390so2474215f8f.1
        for <imx@lists.linux.dev>; Fri, 25 Oct 2024 09:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729874556; x=1730479356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0O8Uc0wNSl4D87GHeRKCxI8rppppACfX2yHi51S2vCI=;
        b=QaBuost4NTQ6bQ+QPck5S8RB7e7tt6X4ZWfSpHGT8iUsxNpG7Q5O0NVoR6A4JOy2sJ
         UkD+TyWLo8+/q/nddpK7j/O19kpV+68qqujAis53B9MCnySK5nlq09LBX4I3knsgc+c4
         AzZkINlrT1Ah/1/H+KceRYegGJUt4uSfu9AW3nmPcltKxy8acORS1vjnpwvMDulHj3Kz
         E7i1LUIXw3mU2q2shGof/r6vImW4lGFqs6lBeajq881bp0KaSRZRr+0Zciihttm97bgt
         A7Gc1maYOqL+JWJLA5Fov/STtAsBv+qpS/0c5BBrNrAF9Yek/HBgIfa1xevi4ODc6+6o
         cp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729874556; x=1730479356;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0O8Uc0wNSl4D87GHeRKCxI8rppppACfX2yHi51S2vCI=;
        b=qDfFFr1YWDtYfF2DICr1jW3zNRymjEesLvXWij6pJDnPACMd/KwplHik0aalLm0z7b
         7FpEkVVnBmUHH0vNztKfsGcywiVOxYUXZM1YVQpRYIScL11r/xEQXczR16IAV4Z1LYSB
         bNl2zxtAcIAObJS+SV8RsMRot7j1xGqEwo32fKTim678TYGSVW+RKyWEndg5wm/hwjV+
         95avx5DpOHx8mqFGJ0ccZ3duT0J3kItlAdFxabsF6BxW1zFSiqlM2DrM2NkRrQ187fjA
         vONNEJDQj5SlUbDpivurkvZdHQJ98iYIRXIwvVO+Jq2s3ZVJBH4InlPRTYDEA9MOzdJ9
         fRPg==
X-Forwarded-Encrypted: i=1; AJvYcCXuktLFJtQnsDgRwB/OB7qH87G096JKS4jSEWRRRnnSGYHmuDB/uf9GDq7Wma85uRN3NSU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf1cFtam8u7C02nW9T3XlAr3nYZ8EiFdtjQvaOSm23b5MXeBIi
	WIzWxAKUrq+s3GqNQEo5Y8IMjcdxSU8W2wgNAX5ff4fp27/wzuIlUdLrTIr1f6k=
X-Google-Smtp-Source: AGHT+IGWWlWECktFU+fFJCf5hYHzpUI+6GWpy6U6Cca42a1A4pI401RfzC4B5K/VBVBk4wLfYXYleg==
X-Received: by 2002:a05:6000:e88:b0:37d:460d:2d07 with SMTP id ffacd0b85a97d-3803ac21c2dmr5083831f8f.10.1729874556540;
        Fri, 25 Oct 2024 09:42:36 -0700 (PDT)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b1cc0asm1992815f8f.10.2024.10.25.09.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:42:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, 
 Shen Lichuan <shenlichuan@vivo.com>
Cc: kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 opensource.kernel@vivo.com
In-Reply-To: <20240920021250.4758-1-shenlichuan@vivo.com>
References: <20240920021250.4758-1-shenlichuan@vivo.com>
Subject: Re: [PATCH v1] nvmem: imx-iim: Convert comma to semicolon
Message-Id: <172987455573.287868.16389296993768691961.b4-ty@linaro.org>
Date: Fri, 25 Oct 2024 17:42:35 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Fri, 20 Sep 2024 10:12:50 +0800, Shen Lichuan wrote:
> To ensure code clarity and prevent potential errors, it's advisable
> to employ the ';' as a statement separator, except when ',' are
> intentionally used for specific purposes.
> 
> 

Applied, thanks!

[1/1] nvmem: imx-iim: Convert comma to semicolon
      commit: e2ba37350d1d95c5614defcec32020479fb5148d

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

