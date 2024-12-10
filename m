Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B59F23DEAC
	for <imx@lists.linux.dev>; Tue, 10 Dec 2024 10:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733827066; cv=none; b=R1fkMm2L5sPNgP0kp1dYRmtf8WwgGFMQ3xGwHD7EkJvFOKGwV+skjW4eMwBALvVK9uUNeixES5bmF0ffZMlLp7U+8ID4Ked/Dh2YOFz16p+e55XyaGyJceBgH+sY/vHL2bdA5/favhwvYvvklVhAefncVdIqPX7S6MBI6RZ0ekI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733827066; c=relaxed/simple;
	bh=s2gNrBnpaHs4PuvXcXL3HNFdMIVsXIYH+9x7UBV+JpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rGzVSlf2hUlVn8XPA/9Haw0hdlTVgUvGIYh+KB+3vTbUFu7tNNR0a4yKUFRaRb5GqftAHyX5XEjJ9h87u1FlDzxtijYo1XV0GJahijaTOCIUXsJmluVgIQ4kcUOC9mfXYC3azxSeTm2urW/WrAA5fhCgz4OgielnvgvmdkvyWjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jY7Lo36+; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jY7Lo36+"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so6269414e87.1
        for <imx@lists.linux.dev>; Tue, 10 Dec 2024 02:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733827063; x=1734431863; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2gNrBnpaHs4PuvXcXL3HNFdMIVsXIYH+9x7UBV+JpM=;
        b=jY7Lo36+p48on4vdzWXxn/gSlHsNjdKmKDYqLqhgXlJg+LtNfVGPWW8cOM5o1P+S7z
         92wrdH6wdwMT8ZPSLE/SA0EHsTuFbWS+jdPqKDbMb2nBNOVY0hGWaeEwVW9nuU/HkNIX
         QMNpxi/QLl8uKUunhY0ylRMZKfc8Fobx6S48wFgrumrm83wtT4AXUBI2nFrc7o3o4lhM
         soWAob6WtIDPb/zcRzSEWMoDwEaFPhoAtrKUXJqdQ0vKYYvMVkTOslq42sDVK38340AI
         WfuKpayZM1sPuKg6KGUjs9bijuIrGEikDKvFXUybl8eeJG3Df4Vyg0rI8zdyTMS9zy22
         ASlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733827063; x=1734431863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2gNrBnpaHs4PuvXcXL3HNFdMIVsXIYH+9x7UBV+JpM=;
        b=dEw0JJJ9s2TL8jcKX+xTyUeCjg6Vw0C6ofa5s/9HEBmZvKvXjwbGHqzAgKCV5HYgST
         OCCVzmyjExPAKuRJjlMB7aitxPtOdlbqB5dBvw4WrZ4hIu7Ac0wCRmgREu/OgswqIxe6
         vUMDp2Wt+zlfmpiJlKZyYrBqOaCllvhEbt1RCzwPvARbyd7XgIy4CQFjmmKoTSeAaado
         0HS6gEPCTKN9RJUep4xGCUTnre0g10wGw3+88w0PZgtjaRmG1TxyurnMCIapoSbYwbTI
         qC2EUQkteX4dGFO2WymUFD2qqGl0WSe6feX06yAmCgONQiWuV9mqlYz7kL/QEEJmrysd
         dxKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8kPrZMpxA292mqgyE8ENC1fQakCeTTOzA0ui1z9q5k3xq8/VPC5k48SLIo7R5bqLCs+g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxF1nT1Dj01wO/NuhEQCXYuWCH/IAEApqwdtjWUE4LoeJKh6HyO
	9NPysFQN1nKxy8uLoThCPN32WxgY8hn8YA8oFUWRk70FM82GA2CvYGh/24zOCkHfYbYCtRiPxEH
	VaCs+XiGMFgRttA+Z1/iI5PMpCmE=
X-Gm-Gg: ASbGncvabQg7F5dpSULPiXyH0yC19Z8TRHSbZxarDy+KGqAo/qdEjiQOP1goO23Kjb6
	8xZD67UsBsXh5twA/aRllyrlAfR7+CuURcya87nATv7Ck76gmtgfHfG7/1UHaxRXlHa0=
X-Google-Smtp-Source: AGHT+IGvfRLPmahm50nu+e2exxVcMFSqXgjT/S6Twd+XgTU6pdYj8SRjRoKw86zHc3Jp+T8FWnjKa+Y2nt08isFeJl4=
X-Received: by 2002:ac2:5227:0:b0:53e:362e:ed0 with SMTP id
 2adb3069b0e04-53e362e0f1emr5392719e87.44.1733827063169; Tue, 10 Dec 2024
 02:37:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241210034223.1493522-1-xiaolei.wang@windriver.com>
In-Reply-To: <20241210034223.1493522-1-xiaolei.wang@windriver.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Dec 2024 07:37:31 -0300
Message-ID: <CAOMZO5AzNVd_xut2wBBHeyccFdC+1c4p50Uhzo=+BDbV=mEP2g@mail.gmail.com>
Subject: Re: [PATCH v2] serial: imx: Use uart_port_lock_irq() instead of uart_port_lock()
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: l.stach@pengutronix.de, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	esben@geanix.com, marex@denx.de, ilpo.jarvinen@linux.intel.com, 
	linux@rasmusvillemoes.dk, stefan.eichenberger@toradex.com, 
	l.sanfilippo@kunbus.com, cniedermaier@dh-electronics.com, rickaran@axis.com, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 12:43=E2=80=AFAM Xiaolei Wang
<xiaolei.wang@windriver.com> wrote:
>
> When executing 'ehco mem > /sys/power/state', the following

ehco --> echo

Reviewed-by: Fabio Estevam <festevam@gmail.com>
